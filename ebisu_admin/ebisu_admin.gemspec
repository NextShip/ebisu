$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ebisu_admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ebisu_admin"
  s.version     = EbisuAdmin::VERSION
  s.authors     = ["Taichi Tomioka"]
  s.email       = ["mys.itachi@gmail.com"]
  s.homepage    = ""
  s.summary     = "Manager for ebisu."
  s.description = "Enables to CRUD articles."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "kaminari"
  s.add_dependency "rails", ">= 5.1.4"
  s.add_dependency "rails-i18n"
  s.add_dependency "ransack"
  s.add_dependency 'jquery-rails'
  s.add_dependency "jquery-ui-rails"
  s.add_dependency "select2-rails"
  s.add_dependency "font-awesome-rails"

  s.add_development_dependency "sqlite3"
end
