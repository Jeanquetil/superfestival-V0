class Festival < ApplicationRecord

  has_many :concerts
  has_many :timetables

  validates :name, presence: true
end
