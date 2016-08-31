class Concert < ApplicationRecord

  require 'rspotify'

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

    add_attribute :best_song do
      best_song
    end

    add_attribute :start_hour do
      start_hour
    end

    add_attribute :end_hour do
      end_hour
    end

    add_attribute :in_spotify do
      in_spotify
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
    @festival_start = self.festival.start_date
    @day_of_concert = concert.day
    @day_name = (@festival_start - day_of_concert + 1).strftime("%A")
  end

  def festival_begin
    festival.start_date
  end

  def event_url
    event_url = "/concerts/#{self.id}/events/?day=#{self.day}"
    return event_url
  end

  def start_hour
    self.start_time.to_time.strftime("%H:%M")
  end

  def end_hour
    self.end_time.to_time.strftime("%H:%M")
  end

  def best_song
    if RSpotify::Artist.search("#{self.artist.name}").first
      if RSpotify::Artist.search("#{self.artist.name}").first.top_tracks(:FR).first
      RSpotify::Artist.search(artist.name).first.top_tracks(:FR).first.preview_url
      end
    end
  end

end
