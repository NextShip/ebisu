module Ebisu
  class Category < ApplicationRecord
    # association
    has_many :articles

    accepts_nested_attributes_for :children, allow_destroy: true
  end
end
