module Ebisu
  class Category < ApplicationRecord
    # association
    has_many :articles
  end
end
