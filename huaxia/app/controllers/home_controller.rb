class HomeController < ApplicationController
  def index
    @banners = Banner.all
    @features =  Feature.all
    @testimonial = Testimonial.last
    @gxnu = Information.find_by_permalink("short_gxnu")
  end
end
