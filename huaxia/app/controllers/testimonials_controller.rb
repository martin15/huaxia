class TestimonialsController < ApplicationController

  def index
    @testimonials = Testimonial.paginate(:page => params[:page], :per_page => 3,
                                :order => "created_at DESC" )
  end

  def show
    @testimonial = Testimonial.find_by_id(params[:id])
    if @testimonial.nil?
      flash[:error] = "Cannot find the testimonial"
      redirect_to testimonials_path
    end

  end

end
