class Artist < ApplicationRecord
  include AlgoliaSearch

  has_many :artists

  validates :name, presence: true
  validates :genre, presence: true

  algoliasearch do
    attributesToIndex ['name', 'genre']
    customRanking ['desc(name)']
  end
end
