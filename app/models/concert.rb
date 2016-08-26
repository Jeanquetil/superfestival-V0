class Concert < ApplicationRecord

  belongs_to :festival
  belongs_to :artist
  has_many :events, dependent: :destroy
  validates :day, presence: true

  include AlgoliaSearch

  algoliasearch do
    attributesToIndex ['stage', 'artist_name', 'artist_genre', 'start_time', 'festival_name']

    customRanking ['asc(start_time)']

    add_attribute :artist_name do
      artist_name
    end

    add_attribute :festival_name do
      festival_name
    end

    add_attribute :artist_genre do
      artist_genre
    end

    add_attribute :concert_day do
      concert_day
    end

    add_attribute :festival_begin do
      festival_begin
    end

    add_attribute :event_url do
      event_url
    end
  end

  def artist_name
    artist.name
  end

  def festival_name
    festival.name
  end

  def artist_genre
    artist.genre
  end

  def concert_day
    day
  end

  def festival_begin
    festival.start_date
  end

  def event_url
    event_url = "/concerts/#{self.id}/events/?day=#{self.day}"
    return event_url
  end

end
