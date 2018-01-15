module Ebisu
  class Category < ApplicationRecord
    has_many :articles
  end
end
