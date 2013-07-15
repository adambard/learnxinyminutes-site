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


# Count contributors
ready do

  # Prepare the pages
  pages = sitemap.resources.select{ |r|
    r.path.match(/^docs\/.*\.html/) \
      and not r.path.include?("README") \
      and not r.path.match(/file\.html$/)
  }.sort_by{ |r|
    r.metadata[:page]["language"].downcase
  }
  set :docs, pages

  authors = {}
  pages.each {|p|
    lang = p.metadata[:page]["language"]
    contrib_list = p.metadata[:page]["contributors"]
    if contrib_list.nil?
      authors[lang] = [[p.metadata[:page]["author"], p.metadata[:page]["author_url"]]]
    else
      authors[lang] = contrib_list
    end
  }

  set :authors, authors

  # Count up the contributors with git blame
  contributors = {}
  pages.each{|p|
    system("cd source/docs && git blame #{p.path.split('/')[1]}.markdown >> tmp.txt")
    File::open('source/docs/tmp.txt'){|f|
      names = f.readlines.map{|r|
        name = r.split(' ')[1]
        name[1..name.length]
      }

      lang = p.metadata[:page]["language"]
      contributors[lang] = Set::new(names).length + authors[lang].length - 2
    }
    system("rm source/docs/tmp.txt")
  }
  set :contributors, contributors

  # Prepare code files to serve

  pages.each{ |p|
    lang = p.metadata[:page]["language"]
    filename = p.metadata[:page]["filename"]

    puts filename

    unless filename.nil?
      s = nil
      File::open("source/#{p.path}.markdown") {|f|
        s = StringScanner.new(f.read)
      }

      puts "========================= #{p.path} ===========================\n"
      code = ''
      until s.eos?
        s.skip_until(/^```.*$/)
        out = s.scan_until(/^```/)
        if out.nil?
          break
        end
        code += out
      end

      code = code.gsub('```', '')


      filename = p.metadata[:page]["filename"] || "scratch.php"
      proxy "/docs/files/#{filename}", "/docs/file.html", :locals => {:rawcode => code}, :ignore => true, :layout => false
    end
  }
end

