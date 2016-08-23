class Festival < ApplicationRecord
  include AlgoliaSearch

  has_many :concerts
  has_many :timetables

  validates :name, presence: true

  algoliasearch do
    attributesToIndex ['name, location']
    customRanking ['start_date']
  end
end
