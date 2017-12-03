module Ebisu
  class Article < ApplicationRecord
    # associations
    dragonfly_accessor :image
    has_many :paragraphs

    accepts_nested_attributes_for :paragraphs

    # validations
    validates :title, presence: true
    validates :abstract, presence: true
    # validates :image, presence: true

    def self.toparticles()
      self.all.take(3)
    end

    def build_paragraph(params = {})
      paragraph = paragraphs.build(type: params[:type], position: params[:position]) 
      paragraph&.build_delegate(content: params[:content])
      paragraph
    end
  end
end
