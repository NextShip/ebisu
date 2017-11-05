module Ebisu
  class Paragraph::Body < Paragraph
    has_one :body, class_name: 'Ebisu::Body', foreign_key: 'paragraph_id'
    delegate :content, to: :body, allow_nil: true
  end
end
