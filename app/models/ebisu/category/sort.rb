module Ebisu
  class Category::Sort < Category
    has_many :children, class_name: "Kind", foreign_key: 'parent_id', dependent: :destroy, inverse_of: :parent

    accepts_nested_attributes_for :children, allow_destroy: true
  end
end
