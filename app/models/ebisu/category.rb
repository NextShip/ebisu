module Ebisu
  class Category < ApplicationRecord
    # association
    has_many :articles
    has_many :children, class_name: "Category", foreign_key: "parent_id"
    belongs_to :parent, class_name: "Category", required: false

    accepts_nested_attributes_for :children, allow_destroy: true

    def self.leaves
      Category.where.not(children: nil)
    end
  end
end
