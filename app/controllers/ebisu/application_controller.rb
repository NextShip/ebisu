require "browser"

module Ebisu
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :set_view_variant

    private

    def set_view_variant
      browser = Browser.new("Some User Agent", accept_language: "en-us")
      if browser.device.mobile? != true && browser.device.tablet? != true
        request.variant = :pc
      end
    end
  end
end
