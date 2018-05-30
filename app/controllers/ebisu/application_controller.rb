require "browser"

module Ebisu
  class ApplicationController < ActionController::Base
    include Pundit
    protect_from_forgery with: :exception
    before_action :set_view_variant
    rescue_from Pundit::NotAuthorizedError, with: :redirect_to_404

    private

    def set_view_variant
      if browser.device.mobile? != true && browser.device.tablet? != true
        request.variant = :pc
      end
    end

    def redirect_to_404
      render file: 'public/404.html', status: 404, layout: false
    end
  end
end
