require_dependency "admin/application_controller"

module Admin
  class ArticlesController < ApplicationController
    def index
      @articles = Ebisu::Article.all
    end
  end
end