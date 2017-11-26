module Ebisu
  class Headline < ApplicationRecord
    # associations
    belongs_to :paragraph, foreign_key: :paragraph_id

    # validations
    validates :content, presence: true
  end
end
