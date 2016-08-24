class Event < ApplicationRecord
  belongs_to :timetable
  belongs_to :concert

  validates :timetable, uniqueness: { scope: :concert }
end
