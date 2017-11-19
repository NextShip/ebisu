module Ebisu
  class Article < ApplicationRecord
    dragonfly_accessor :image
    has_many :paragraphs

    def self.toparticles()
      self.all.take(3)
    end
  end
end
