class Event < ApplicationRecord
  belongs_to :timetable
  belongs_to :concert
end
