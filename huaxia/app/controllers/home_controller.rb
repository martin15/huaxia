class HomeController < ApplicationController
  def index
    @banners = Banner.all
    @features =  Feature.order("updated_at DESC").limit(3)
    @testimonial = Testimonial.last
    @gxnu = Information.find_by_permalink("short_gxnu")
  end
end
