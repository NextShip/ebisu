module Ebisu
  class Paragraph::Headline < Paragraph
    has_one :delegate, class_name: 'Ebisu::Headline', foreign_key: 'paragraph_id', dependent: :destroy
    delegate :content, to: :delegate, allow_nil: true
  end
end
