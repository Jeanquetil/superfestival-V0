class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # @festivals = Festival.where("end_date > ?", Date.today) On garde mais pour la démo on affiche les anciens festivals pour remplir...
    @festivals = Festival.all
  end
end
