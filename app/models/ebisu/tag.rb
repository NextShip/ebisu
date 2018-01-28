module Ebisu
  class Tag < ApplicationRecord
  	# asociations
  	has_many :article_tags
    has_many :articles, through: :article_tags

    # varidations
    validates :name, presence: true
  end
end
