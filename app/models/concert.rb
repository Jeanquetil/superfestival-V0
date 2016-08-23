class Concert < ApplicationRecord
  include AlgoliaSearch

  belongs_to :festival
  belongs_to :artist
  has_many :events

  algoliasearch do
    attributesToIndex ['stage']
    customRanking ['artist_id']
  end
end
