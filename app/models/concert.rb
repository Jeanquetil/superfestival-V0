class Concert < ApplicationRecord
  belongs_to :festival
  belongs_to :artist
end
