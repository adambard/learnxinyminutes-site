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

class Article
  attr_accessor :category, :name, :contributors, :contributor_count, :filename, :rawcode, :url
  def initialize(r)
    begin
      @name = r.metadata[:page].fetch("language", nil)

      @category = r.metadata[:page].fetch("category", nil)
      if @category.nil? && @name
        @category = "language"
      else
        @category = r.metadata[:page].fetch("category", "meta")
      end

      @name = case @category
        when "language" then r.metadata[:page]["language"]
        when "tool" then r.metadata[:page]["tool"]
        else ""
      end
    rescue
      @name = ""
      @category = "meta"
    end

    # Get a list of the authors
    @contributors = r.metadata[:page].fetch("contributors", nil)
    if @contributors.nil?
      @contributors = [[r.metadata[:page]["author"], r.metadata[:page]["author_url"]]]
    end

    # Count other contributors with git blame
    system("cd source/docs && git blame #{r.path.split('/')[1]}.markdown >> tmp.txt")
    File::open('source/docs/tmp.txt'){|f|
      names = f.readlines.map{ |line|
        name = line.split(' ')[1]
        name[1..name.length]
      }

      @contributor_count = Set::new(names).length + @contributors.length - 2
    }
    system("rm source/docs/tmp.txt")

    @filename = r.metadata[:page].fetch("filename", nil)
    if @filename.nil?
      @rawcode = nil
    else
      s = nil
      File::open("source/#{r.path}.markdown") {|f|
        s = StringScanner.new(f.read)
      }

      puts "========================= #{r.path} ===========================\n"
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

    @url = r.url
  end

  def to_s
    "Article #{@category}: #{@name} (#{@contributors})"
  end
end

class ArticleManager
  attr_accessor :articles, :articles_by_name, :articles_by_category
  def initialize(sitemap)
    @articles = sitemap.resources.map{|r| Article.new(r)}
    @articles_by_category = articles.group_by{|r| r.category}
    @articles_by_name = articles.group_by{|r| r.name}
  end

  def get(page)
    get_article(page)
  end
  def get_article(page)
    category = page.fetch("category", "language")
    @articles_by_name[page[category]][0]
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

