class HomeController < ApplicationController
  def index
    @banners = Banner.all
    @features =  Feature.all
    @testimonial = Testimonial.last
  end
end
