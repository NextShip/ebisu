module Ebisu
  class Subheadline < ApplicationRecord
    # associations
    belongs_to :paragraph, foreign_key: :paragraph_id, optional: true

    # validations
    validates :content, presence: true
  end
end
