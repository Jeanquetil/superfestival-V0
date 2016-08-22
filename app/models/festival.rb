class Festival < ApplicationRecord
  has_many :concerts
  has_many :timetables
end
