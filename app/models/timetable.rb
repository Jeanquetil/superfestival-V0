class Timetable < ApplicationRecord
  belongs_to :user
  belongs_to :festival
  has_many :events
end
