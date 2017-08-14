module Ebisu
  class Article < ApplicationRecord
    has_many :paragraphs
  end
end
