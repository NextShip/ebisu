module Ebisu
  class Category::Kind < Category
    has_many :children, class_name: "Type", foreign_key: 'parent_id', dependent: :destroy
  	belongs_to :parent, class_name: "Sort", required: false, inverse_of: :children
  end
end
