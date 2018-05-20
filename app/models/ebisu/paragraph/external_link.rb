module Ebisu
  class Paragraph::ExternalLink < Paragraph
    has_one :delegate, class_name: 'Ebisu::ExternalLink', foreign_key: 'paragraph_id', dependent: :destroy
    delegate :content, to: :delegate, allow_nil: true
    delegate :url, to: :delegate, allow_nil: true

    accepts_nested_attributes_for :delegate, allow_destroy: true
  end
end
