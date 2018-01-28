require "rails"

module Ebisu
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)

    def create_directories
      empty_directory "app/views/ebisu/articles"
    end

    def install_migrations
      say_status :copying, "migrations"
      `rake railties:install:migrations`
    end

    def run_migrations
      say_status :running, "migrations"
      `rake db:migrate VERBOSE=false`
    end

    def copy_initializer_file
      copy_file "ebisu.rb", "config/initializers/ebisu.rb"
    end

    def copy_locale_file
      copy_file "ebisu.ja.yml", "config/locales/ebisu.ja.yml"
    end
  end
end
