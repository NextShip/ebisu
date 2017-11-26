module Ebisu
  class Paragraph < ApplicationRecord
    include RankedModel

    # associations
    belongs_to :article
    ranks :position

    # validations
    # validates :position, presence: true
  end
end
