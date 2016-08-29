class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    user = User.find_for_facebook_oauth(request.env['omniauth.auth'])

    if user.persisted?
      sign_in_and_redirect user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def spotify
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    current_user.update(hash_spotify: spotify_user.to_hash)
    my_playlist
    redirect_to festival_path(@festival)


    # spotify_user.create = RSpotify::User.new(token_spotify:)
    # spotify_user.whatever
    # redirect
    # spotify.html.erb

  end

  def my_playlist
    spotify_user = RSpotify::User.new(current_user.hash_spotify)
    playlist = spotify_user.create_playlist!('my_playlist_for_this_festoch')
    Timetable.events.each do |event|
      track = RSpotify::Artist.search(event.concert.artist.name).first.top_tracks(:FR).first
      playlist.add_tracks!(track)
    end
  end

  def failure
    flash[:alert] = ""
    redirect_to root_path
  end
end
