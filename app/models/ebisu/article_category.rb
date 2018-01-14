module Ebisu
  class ArticleCategory < ApplicationRecord
  	belongs_to :article
  	belongs_to :category
  end
end
