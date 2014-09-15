class Admin::TestimonialsController < Admin::ApplicationController
  before_filter :find_testimonial, :only => [:show, :destroy, :edit, :update]

  def index
    params[:page] = params[:page].to_i == 0 ? 1 : params[:page]
    @testimonials = Testimonial.paginate(:page => params[:page], :per_page => 5,
                                         :order => "created_at DESC" )
    @no = params[:page].to_i * 5
  end

  def new
    @testimonial = Testimonial.new
  end

  def create
    @testimonial = Testimonial.new(params[:testimonial])
    if @testimonial.save
      flash[:notice] = "Testimonial successfully created"
      redirect_to admin_testimonials_path
    else
      flash[:error] = "Testimonial failed to create<br />Pleace choose the Image"
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @testimonial.update_attributes(params[:testimonial])
      flash[:notice] = "Testimonial successfully updated"
      redirect_to admin_testimonials_path
    else
      flash[:error] = "Testimonial failed to update"
      render :action => "edit"
    end
  end

  def destroy
    flash[:notice] =  @testimonial.destroy ? 'Testimonial was successfully deleted.' : 'Testimonial was falied to delete.'
    redirect_to admin_testimonials_path
  end

  private
    def find_testimonial
      @testimonial = Testimonial.find_by_id(params[:id])
      if @testimonial.nil?
        flash[:notice] = "Cannot find the Testimonial with id '#{params[:id]}'"
        redirect_to admin_testimonials_path
      end
    end
end
