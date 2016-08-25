class Timetable < ApplicationRecord
  belongs_to :user
  belongs_to :festival
  has_many :events, dependent: :destroy
  validates :day, presence: true, numericality: { other_than: 0 }
end
