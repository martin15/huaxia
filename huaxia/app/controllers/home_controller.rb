class HomeController < ApplicationController
  def index
    @banners = Banner.all
    @features =  Feature.all
  end
end
