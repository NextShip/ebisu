$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ebisu/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ebisu"
  s.version     = Ebisu::VERSION
  s.authors     = ["rainbowaffro", "Taichi Tomioka"]
  s.email       = ["akihito.tsuboi@gmail.com", "mys.itachi@gmail.com"]
  s.homepage    = "http://next-ship.net"
  s.summary     = "Rails CMS Project"
  s.description = "Rails CMS Project"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "ebisu_admin"
  s.add_dependency "rails", "~> 5.1.3"
  s.add_dependency 'sass-rails', '~> 5.0'
  s.add_dependency "slim-rails"
  s.add_dependency "dragonfly", "~> 1.1.3"
  s.add_dependency "ranked-model"
  s.add_dependency "draper"
  s.add_dependency "devise"
  s.add_dependency "pundit"
  s.add_dependency "rolify"
  s.add_dependency "browser"
  s.add_dependency "dragonfly-s3_data_store"
  s.add_dependency "ruby-oembed"
  s.add_dependency "mime-types"
  s.add_dependency "impressionist", "~> 1.6"

  s.add_development_dependency "sqlite3"
end
