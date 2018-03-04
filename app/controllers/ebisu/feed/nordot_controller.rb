require_dependency "ebisu/application_controller"

module Ebisu
  module Feed
    class NordotController < ApplicationController
      layout false

      def index
        @articles = Ebisu::Article.published.limit(10)

        respond_to do |format|
          format.rss
        end
      end
    end
  end
end
