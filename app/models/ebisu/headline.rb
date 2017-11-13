module Ebisu
  class Headline < ApplicationRecord
    belongs_to :paragraph, foreign_key: :paragraph_id
  end
end
