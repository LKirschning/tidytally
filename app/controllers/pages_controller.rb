class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def setup
  end

  def roommate
    @roommates = []
  end

end
