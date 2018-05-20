module Ebisu
  class Paragraph < ApplicationRecord
    include RankedModel

    # associations
    has_one :delegate, dependent: :destroy
    belongs_to :article
    ranks :position, class_name: 'Ebisu::Paragraph'

    accepts_nested_attributes_for :delegate, allow_destroy: true

    # validations
    validates :position, presence: true

    SUBCLASSES = %w(
      Ebisu::Paragraph::Headline
      Ebisu::Paragraph::Subheadline
      Ebisu::Paragraph::Body
      Ebisu::Paragraph::Figure
      Ebisu::Paragraph::Quotation
      Ebisu::Paragraph::Tweet
      Ebisu::Paragraph::Youtube
      Ebisu::Paragraph::ExternalLink
    )
  end
end
