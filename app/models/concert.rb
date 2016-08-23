class Concert < ApplicationRecord
  belongs_to :festival
  belongs_to :artist
  has_many :events

  scope :of_the_day, -> (datetime) { where("? <= start_time AND start_time < ?", datetime, datetime + 1.day)}
end
