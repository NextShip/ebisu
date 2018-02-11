module Ebisu
  class Category::Type < Category
  	belongs_to :parent, class_name: "Kind", required: true
  end
end
