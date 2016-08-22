class Artist < ApplicationRecord
  has_many :artists

  validates :name, presence: true
  validates :genre, presence: true
end
