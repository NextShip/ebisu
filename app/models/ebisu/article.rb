module Ebisu
  class Article < ApplicationRecord
  	dragonfly_accessor :image
    has_many :paragraphs
  end
end
