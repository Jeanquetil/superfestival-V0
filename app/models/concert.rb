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
  #   # day = @festival.concerts.of_the_day(params[:date].to_datetime + 6.hours)
  #   # concert_events_path(concert, day: @dates.index(concert.start_time.to_date) + 1, date: concert.start_time.to_date), method: :post
end

def festival_begin
  festival.start_date
end

end
