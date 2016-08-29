class UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def spotify
    binding.pry
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
  end
end
