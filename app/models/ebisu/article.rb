module Ebisu
  class Article < ApplicationRecord
    # associations
    dragonfly_accessor :image do
      default Rails.root.join('no-image.jpg')
    end
    has_many :paragraphs, dependent: :destroy
    accepts_nested_attributes_for :paragraphs, allow_destroy: true, reject_if: proc { |attributes| attributes[:template] }
    belongs_to :category

    # validations
    validates :title, presence: true
    validates :abstract, presence: true
    validates :category_id, presence: true

    def self.toparticles()
      self.all.take(3)
    end

    def build_paragraph(params = {})
      paragraphs.build(type: params[:type], position: params[:position], delegate_attributes: { content: params[:content] })
    end

    def self.template_article
      self.new do |article|
        article.paragraphs.build(type: "Ebisu::Paragraph::Headline", delegate_attributes: {})
        article.paragraphs.build(type: "Ebisu::Paragraph::Body", delegate_attributes: {})
        article.paragraphs.build(type: "Ebisu::Paragraph::Figure", delegate_attributes: {})
      end
    end

    def self.recommendations
      all
    end
  end
end
