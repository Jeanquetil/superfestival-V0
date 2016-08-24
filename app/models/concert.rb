class Concert < ApplicationRecord

  belongs_to :festival
  belongs_to :artist
  has_many :events

  scope :of_the_day, -> (datetime) { where("? <= start_time AND start_time < ?", datetime, datetime + 1.day)}

  include AlgoliaSearch

  algoliasearch do
    attributesToIndex ['stage', 'artist_name', 'artist_genre', 'start_time']

    customRanking ['asc(artist_id)']

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
    ((end_time - 6.hours).to_date - festival_begin).to_i + 1
  end

  def festival_begin
    festival.start_date
  end

  def event_url
    dates = (self.festival.start_date..self.festival.end_date).map(&:to_date)
    event_url = "/concerts/#{self.id}/events/?day=#{dates.index(self.start_time.to_date) + 1}"
    return event_url
  end

end
