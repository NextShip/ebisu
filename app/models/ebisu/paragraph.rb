module Ebisu
  class Paragraph < ApplicationRecord
    include RankedModel
    belongs_to :article
    ranks :position, class_name: 'Paragraph'
  end
end
