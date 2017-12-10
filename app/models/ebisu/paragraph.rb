module Ebisu
  class Paragraph < ApplicationRecord
    include RankedModel

    # associations
    has_one :delegate
    belongs_to :article
    ranks :position, class_name: 'Ebisu::Paragraph'

    accepts_nested_attributes_for :delegate, allow_destroy: true

    # validations
    validates :position, presence: true
  end
end
