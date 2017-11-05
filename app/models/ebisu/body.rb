module Ebisu
  class Body < ApplicationRecord
    belongs_to :paragraph, foreign_key: :paragraph_id
  end
end
