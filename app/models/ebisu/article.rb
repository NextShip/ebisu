module Ebisu
  class Article < ApplicationRecord
  	# associations
    dragonfly_accessor :image
    has_many :paragraphs

    # validations
    validates :title, presence: true
    validates :abstract, presence: true
    validates :image, presence: true

    def self.toparticles()
      self.all.take(3)
    end
  end
end
