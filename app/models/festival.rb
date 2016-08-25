class Festival < ApplicationRecord

  has_many :concerts, dependent: :destroy
  has_many :timetables, dependent: :destroy

  validates :name, presence: true
end
