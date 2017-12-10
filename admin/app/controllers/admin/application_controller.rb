module Admin
  class ApplicationController < ActionController::Base
    include Pundit
    protect_from_forgery with: :exception
    before_action :authenticate_writer!
    rescue_from Pundit::NotAuthorizedError, with: :redirect_to_404

    def authenticate_writer!
      authorize [:admin, :application], :writer?
    end

    def redirect_to_404
      render file: 'public/404.html', status: 404, layout: false
    end
  end
end
