activate :directory_indexes
activate :syntax
activate :clementine
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'img'

with_layout :doc do
  page "/docs/*"
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end

#
###
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

IGNORED = [
  # "docs/ko-kr/lua-kr.html.markdown"
]

class Article
  attr_accessor :category, :name, :contributors, :contributor_count, :filename, :rawcode, :url, :language, :translations, :translators

  def initialize(r)
    @resource = r
    @path = r.path
    meta = r.metadata[:page]

    set_name_and_category(meta)
    set_contributors(meta)
    set_contributor_count(r.path)
    set_rawcode(r)

    @language = r.metadata[:page].fetch("lang", "en")
    @translations = []
    @translators = r.metadata[:page].fetch("translators", [])

    @url = r.url
  end


  def set_name_and_category(meta)
    begin
      @name = meta.fetch("name", nil)

      if @name.nil?
        @name = meta.fetch("language", nil)
      end

      @category = meta.fetch("category", nil)
      if @category.nil? && @name
        @category = "language"
      else
        @category = meta.fetch("category", "meta")
        puts "META FOR #{@path}: #{meta}"
      end

      @name = case @category
        when "language" then meta["language"]
        when "tool" then meta["tool"]
        else ""
      end
    rescue e
      puts "ERROR: " + e.to_s
      @name = ""
      @category = "meta"
    end
  end

  def set_contributors(meta)
    # Get a list of the authors
    @contributors = meta.fetch("contributors", nil)
    if @contributors.nil?
      @contributors = [[meta["author"], meta["author_url"]]]
    end
  end

  def set_contributor_count(path)
    # Count other contributors with git blame
    system("cd source/docs && git blame #{path.split('/')[1]}.markdown >> tmp.txt")
    File::open('source/docs/tmp.txt'){|f|
      names = f.readlines.map{ |line|
        name = line.split(' ')[1]
        name[1..name.length]
      }

      cnt = Set::new(names).length + @contributors.length - 2
      @contributor_count = (cnt > 0 ? cnt : 0)
    }
    system("rm source/docs/tmp.txt")
  end

  def set_rawcode(r)
    meta = r.metadata[:page]

    @filename = meta.fetch("filename", nil)
    if @filename.nil?
      @rawcode = nil
      return
    end

    s = nil
    File::open("source/#{r.path}.markdown") {|f|
      s = StringScanner.new(f.read)
    }

    code = ''
    until s.eos?
      s.skip_until(/^```.*$/)
      out = s.scan_until(/^```/)
      if out.nil?
        break
      end
      code += out
    end

    @rawcode = code.gsub('```', '')
  end

  def to_s
    "Article #{@category}: #{@name} (#{@contributors}): #{@path}"
  end

  def add_translation a
    @translations.push a
  end

end

class ArticleManager
  attr_accessor :articles, :articles_by_name, :articles_by_category_en
  def initialize(sitemap)
    @articles = sitemap.resources.select{|r|
      not IGNORED.include?(r.path)
    }.map{|r| Article.new(r)}
    @articles_en = @articles.select{|a|a.language == "en"}

    @articles_by_category = @articles.group_by{|r| r.category}
    @articles_by_name = @articles.group_by{|r| r.name}

    @articles_by_category_en = @articles_en.group_by{|r| r.category}
    @articles_by_name_en = @articles_en.group_by(&:name)

    @articles.each{|a| puts a.url + ": " + a.language + " (" + a.category + ")"}
    @articles.select{|a| a.language != "en" and not a.name.nil?}.each{|a|
      a2 = @articles_by_name_en.fetch(a.name, [nil])[0]
      if not a2.nil? and not a2.translations.nil?
        a2.add_translation a
      end
    }
  end

  def get(page)
    get_article(page)
  end

  def get_article(page)
    category = page.fetch("category", "language")
    language = page.fetch("lang", "en")


    @articles_by_name[page[category]].select{|a|
      a.language == language
    }[0]
  end

  def contributors(page)
    get_article(page).contributors
  end

  def name(page)
    get_article(page).name
  end

  def contributor_count(page)
    get_article(page).contributor_count
  end

  def filename(page)
    get_article(page).filename
  end

  def rawcode(page)
    get_article(page).rawcode
  end

end

# Count contributors
ready do

  articles = ArticleManager.new(sitemap)
  set :articles, articles

  articles.articles.select{|a| not a.filename.nil?}.each{|a|
    proxy "/docs/files/#{a.filename}", "/docs/file.html", :locals => {:rawcode => a.rawcode}, :ignore => true, :layout => false
  }
end

