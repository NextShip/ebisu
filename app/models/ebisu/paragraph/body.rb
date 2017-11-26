module Ebisu
  class Paragraph::Body < Paragraph
    has_one :delegate, class_name: 'Ebisu::Body', foreign_key: 'paragraph_id'
    delegate :content, to: :delegate, allow_nil: true
  end
end
