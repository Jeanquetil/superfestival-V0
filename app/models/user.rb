class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook, :spotify]

  has_many :timetables

  def self.find_for_facebook_oauth(auth)
    user_params = auth.to_h.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  def find_or_create_timetable_for!(festival, day)
    @timetable = Timetable.find_by(user: self, festival: festival, day: day)
    unless @timetable
      @timetable = Timetable.create!(user: self, festival: festival, day: day)
      @timetable.update(day_week: (@timetable.festival.start_date + @timetable.day - 1).strftime("%A %d").to_s)
    end
    return @timetable
  end

  def spotify_user
    RSpotify::User.new(self.credentials)
  end

end
