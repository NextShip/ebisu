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

    def build_headline(params = {})
      headline = Headline.new(content: params[:content])
      paragraphs.build(type: "Ebisu::Paragraph::Headline", headline: headline, position: params[:position])
    end

    def build_body(params = {})
      body = Body.new(content: params[:content])
      paragraphs.build(type: "Ebisu::Paragraph::Body", body: body, position: params[:position])
    end
  end
end
