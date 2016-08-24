class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  skip_after_action :verify_authorized, only: [ :home ]

  def home
    @festivals = Festival.where("end_date > ?", Date.today)
  end
end
