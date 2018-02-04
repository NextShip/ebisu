module Ebisu
  class Category < ApplicationRecord
    # association
    has_many :articles
    has_many :children, class_name: "Category", foreign_key: "parent_id"
    belongs_to :parent, class_name: "Category", required: false

    def self.leaves
      Category.where.not(children: nil)
    end
  end
end
