module EbisuAdmin
  module ApplicationHelper
    def template_id(class_name)
      class_name.underscore.gsub(/\//, "_") + "_template"
    end
  end
end
