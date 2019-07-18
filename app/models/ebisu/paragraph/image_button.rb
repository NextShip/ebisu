module Ebisu
  class Paragraph::ImageButton < Paragraph
    has_one :delegate, class_name: 'Ebisu::ImageButton', foreign_key: 'paragraph_id', dependent: :destroy
    delegate :content, to: :delegate, allow_nil: true
    delegate :link_to, to: :delegate, allow_nil: true
    delegate :alt, to: :delegate, allow_nil: true

    accepts_nested_attributes_for :delegate, allow_destroy: true
  end
end
