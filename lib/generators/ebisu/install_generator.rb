require "rails"

module Ebisu
  class InstallGenerator < Rails::Generators::Base

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
  end
end