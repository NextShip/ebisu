module Ebisu
  class Paragraph < ApplicationRecord
    include RankedModel

    # associations
    belongs_to :article
    ranks :position, class_name: 'Ebisu::Paragraph'

    # validations
    validates :position, presence: true
  end
end
