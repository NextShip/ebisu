module Ebisu
  class Paragraph::Quotation < Paragraph
    has_one :delegate, class_name: 'Ebisu::Quotation', foreign_key: 'paragraph_id', dependent: :destroy
    delegate :content, to: :delegate, allow_nil: true

    accepts_nested_attributes_for :delegate, allow_destroy: true
  end
end
