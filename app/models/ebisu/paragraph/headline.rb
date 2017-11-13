module Ebisu
  class Paragraph::Headline < Paragraph
    has_one :headline, class_name: 'Ebisu::Headline', foreign_key: 'paragraph_id'
    delegate :content, to: :headline, allow_nil: true
  end
end
