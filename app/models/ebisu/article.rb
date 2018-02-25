module Ebisu
  class Article < ApplicationRecord
    # add-ons
    is_impressionable counter_cache: true

    # associations
    dragonfly_accessor :image do
      default '/public/images/no-image.jpg'
    end
    has_many :paragraphs, dependent: :destroy
    has_many :article_tags, dependent: :destroy
    has_many :tags, through: :article_tags
    accepts_nested_attributes_for :paragraphs, allow_destroy: true, reject_if: proc { |attributes| attributes[:template] }
    belongs_to :category
    belongs_to :user

    # validations
    validates :title, presence: true
    validates :abstract, presence: true
    validates :category_id, presence: true
    validates :user_id, presence: true

    # scopes
    scope :published, -> {
      where(is_published: true)
    }

    # class methods
    def self.toparticles()
      self.published.take(3)
    end

    def self.recommendations
      published
    end

    def self.template_article
      self.new do |article|
        Ebisu::Paragraph::SUBCLASSES.each do |klass|
          article.paragraphs.build(type: klass.to_s, delegate_attributes: {})
        end
      end
    end

    # instance methods
    def build_paragraph(params = {})
      paragraphs.build(type: params[:type], position: params[:position], delegate_attributes: { content: params[:content] })
    end
  end
end
