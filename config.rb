require 'pygments'
require 'open3'

activate :directory_indexes

activate :syntax
module ::Middleman::Syntax::Highlighter
  def self.highlight(code, language=nil, opts={})
    language ||= 'text' # disable language guessing
    Pygments.highlight(code, lexer: language)
  end
end

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true, :tables => true, :strikethrough => true

set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'img'

page '/docs/*', layout: 'doc'

helpers do
  def twitter_share_url(url, doc)
      full_url = "https://learnxinyminutes.com" + (url || "")
      text = (doc || "")
      qs = URI.encode_www_form("url" => full_url, "text" => text)
      "https://twitter.com/intent/tweet?#{qs}"
  end
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
  "js/script",
  ".htaccess",
  "404.html",
  "crossdomain.xml",
  "favicon.ico",
  "humans.txt",
  "index.html",
  "LICENSE",
  "LICENSE.txt",
  "robots.txt",
  "js/script.js",
  "css/dark.css",
  "css/index.css",
  "css/light.css",
  "css/main.css",
  "css/normalize.css",
  "css/screen.css",
  "docs/Gemfile",
  "docs/Gemfile.lock",
  "docs/hre.csv",
  "docs/pets.csv",
  "docs/Rakefile",
  "docs/README.markdown",
  "docs/LICENSE.txt",
  "docs/images/cairo/build.png",
  "docs/images/cairo/connect.png",
  "docs/images/cairo/connect2.png",
  "docs/images/cairo/declare.png",
  "docs/images/cairo/deploy.png",
  "docs/images/solidity/",
  "docs/images/solidity/copy-address.png",
  "docs/images/solidity/metamask-kovan.png",
  "docs/images/solidity/remix-add-token.png",
  "docs/images/solidity/remix-choose-file.png",
  "docs/images/solidity/remix-compile.png",
  "docs/images/solidity/remix-deploy.png",
  "docs/images/solidity/remix-interact.png",
  "docs/images/solidity/remix-solidity.png",
  "docs/images/solidity/remix-testnet.png",
  "docs/images/solidity/send-link.png",
  "docs/README",
  "docs/CONTRIBUTING",
  "docs/tests/yaml.rb",
  "docs/tests/encoding.rb",
  "docs/tests/yaml",
  "docs/tests/encoding",
  "docs/file.html.erb",
  "docs/.github/PULL_REQUEST_TEMPLATE.md",
  "docs/.github/ISSUE_TEMPLATE.md",
  "docs/.github/PULL_REQUEST_TEMPLATE",
  "docs/.github/ISSUE_TEMPLATE",
  "docs/.github/CODEOWNERS",
  "docs/.gitattributes",
  "docs/.gitignore",
  "docs/.mailmap",
  "docs/.travis.yml",
  "docs/tmp.txt",
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

    @language = r.metadata[:page].fetch(:lang, "en")
    @translations = []
    @translators = r.metadata[:page].fetch(:translators, [])

    @url = r.url
  end


  def set_name_and_category(meta)
    begin
      @name = meta.fetch(:name, nil)

      if @name.nil?
        @name = meta.fetch(:language, nil)
      end

      @category = meta.fetch(:category, nil)
      if @category.nil? && @name
        @category = "language"
      else
        @category = meta.fetch(:category, "meta")
      end

      @name_key = case @category
        when "language" then :language
        when "framework" then :framework
        when "tool" then :tool
        else :name
      end

      @name = meta.fetch(@name_key, "")

    rescue e
      puts "ERROR: " + e.to_s
      @name = ""
      @category = "meta"
    end
  end

  def set_contributors(meta)
    # Get a list of the authors
    @contributors = meta.fetch(:contributors, nil)
    if @contributors.nil?
      @contributors = [[meta[:author], meta[:author_url]]]
    end
  end

  def set_contributor_count(path)
    dir, filename = File.split(path)
    # remove "docs/"
    dir = dir.split(File::SEPARATOR)[1..-1]
    path = File.join(*dir, filename + '.markdown')
    # Returns no output but status code 0
    # stdout, stderr, status = Open3.capture3('git', 'shortlog', '-s', '--', path, chdir: 'source/docs')
    stdout, stderr, status = Open3.capture3('git', 'blame', '--', path, chdir: 'source/docs')
    if status.success?
      names = stdout.lines.map{ |line|
        # TODO: doesn't handle spaces in names
        name = line.split(' ')[1] || ''
        name[1..name.length]
      }

      cnt = Set::new(names).length + @contributors.length - 2
      @contributor_count = (cnt > 0 ? cnt : 0)

    else
      puts "git blame error: #{stderr}"
    end
  end

  def set_rawcode(r)
    meta = r.metadata[:page]

    @filename = meta.fetch(:filename, nil)
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
  attr_accessor :articles, :articles_by_name, :articles_by_category_en, :categories_en
  def initialize(sitemap)
    @articles = sitemap.resources.select{|r|
      not IGNORED.include?(r.path)
    }.map{|r|
      Article.new(r)
    }.sort{|a1, a2| a1.name.downcase <=> a2.name.downcase }
    @articles_en = @articles.select{|a|a.language == "en"}

    @articles_by_category = @articles.group_by{|r| r.category}
    @articles_by_name = @articles.group_by{|r| r.name}

    @articles_by_category_en = @articles_en.group_by{|r| r.category}
    @articles_by_name_en = @articles_en.group_by(&:name)

    @categories_en = ["language", "framework", "tool", "Algorithms & Data Structures"] | articles_by_category_en.keys

    #@articles.each{|a| puts a.url + ": " + a.language + " (" + a.category + ")"}
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

  def get_category_display_name(c)
    case c
      when "language" then "Languages"
      when "framework" then "Frameworks and Libraries"
      when "tool" then "Tools"
      else c
    end
  end

  def get_article(page)
    name = page.fetch(:name,
      page.fetch(:tool,
        page.fetch(:framework,
          page.fetch(:language, nil))))

    language = page.fetch(:lang, "en")

    @articles_by_name.fetch(name).select{|a|
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

class I18N
  def initialize(articles)
    @articles = articles
  end

  def t(data, page, key)
    language = @articles.get(page).language.sub('-', '_')
    translations = data.i18n[language] || data.i18n['default']
    translations[key] || data.i18n['default'][key]
  end

  def p(data, page, key, num)
    language = @articles.get(page).language.sub('-', '_')
    newkey = key
    if num == 1
      newkey += '-one'
    else
      newkey += '-other'
    end
    data.i18n.dig(language, newkey) || data.i18n.dig(language, key) || data.i18n.dig('default', newkey) || data.i18n.dig('default', key)
  end
end

# Count contributors
ready do
  articles = ArticleManager.new(sitemap)
  set :articles, articles
  set :i18n, I18N.new(articles)

  articles.articles.select{|a| not a.filename.nil?}.each{|a|
    proxy "/docs/files/#{a.filename}", "/docs/file.html", :locals => {:rawcode => a.rawcode}, :ignore => true, :layout => false
  }
end

