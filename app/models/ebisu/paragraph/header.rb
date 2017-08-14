module Ebisu
  class Paragraph::Header < Paragraph
    has_one :header, class_name: 'Ebisu::Header', foreign_key: 'paragraph_id'
    delegate :content, to: :header, allow_nil: true
  end
end
