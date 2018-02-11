module Ebisu
  class Category::Sort < Category
    has_many :children, class_name: "Kind", foreign_key: 'parent_id', dependent: :destroy
  end
end
