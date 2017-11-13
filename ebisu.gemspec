$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ebisu/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ebisu"
  s.version     = Ebisu::VERSION
  s.authors     = ["rainbowaffro"]
  s.email       = ["akihito.tsuboi@gmail.com"]
  s.homepage    = "http://next-ship.net"
  s.summary     = "Rails CMS Project"
  s.description = "Rails CMS Project"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.3"
  s.add_dependency "slim-rails"
  s.add_dependency "rails_admin"
  s.add_dependency "dragonfly", "~> 1.1.3"
  s.add_dependency "ranked-model"
  s.add_dependency "draper"

  s.add_development_dependency "sqlite3"
end
