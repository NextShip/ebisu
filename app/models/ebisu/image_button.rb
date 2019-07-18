module Ebisu
  class ImageButton < ApplicationRecord
    dragonfly_accessor :content, app: :ebisu
  	
    # associations
    belongs_to :paragraph, foreign_key: :paragraph_id, optional: true

    # validations
    validates :content, presence: true
  end
end
