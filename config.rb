###
# Compass
###

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

require 'slim'
Slim::Engine.disable_option_validator!

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

set :css_dir, 'css'

set :js_dir, 'js'

set :images_dir, 'pics'

page "/feed.xml", :layout => false

activate :directory_indexes
activate :syntax
activate :blog do |blog|
  blog.permalink = "blog/:title.html"
  blog.sources = "blog/:title.html"
  blog.layout = "layouts/blog"
end
activate :deploy do |deploy|
  deploy.method = :git
  deploy.branch = "master"
end

require 'rack/subset'

use Rack::Subset, {
  :subset_css_prefix => 'cjk',
  :symbol_font_map => {
    'hymb' => ['hymb', '.ttf'],
    'zqzmxs' => ['zqzmxs', '.ttf'],
  },
  :prefix => 'webfont',
  :font_file_dir => 'font',
  :font_dist_dir => 'font_dist',
  :public_path => File.expand_path('../source', __FILE__)
}

configure :build do
  activate :minify_css

  activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end
require 'middleman-sprockets'
after_configuration do
  sprockets.append_path "./source/font_dist"
end
