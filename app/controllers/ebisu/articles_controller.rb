require_dependency "ebisu/application_controller"

module Ebisu
  class ArticlesController < ApplicationController
    def index
      @articles = Article.all
    end
  end
end
