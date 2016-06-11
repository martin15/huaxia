class Admin::TourTravelsController < Admin::ApplicationController
  before_filter :find_tour_travel, :only => [:show, :edit, :destroy, :update]

  def index
    params[:page] = params[:page].to_i == 0 ? 1 : params[:page] unless params[:page].nil?
    @tour_travels = TourTravel.parent_tour_travel.paginate(:page => params[:page], :per_page => 10,
                                         :order => "created_at DESC" )
    @no = params[:page].nil? ? 0 : (params[:page].to_i-1) * 10
  end

  def new
    @tour_travel = TourTravel.new
  end

  def create
    puts params.inspect
    @new_tour_travel = TourTravel.new(params[:tour_travel])
    @new_tour_travel.order_no = Time.now.to_i if @new_tour_travel.order_no.blank?
    unless params[:id].nil?
      find_tour_travel
      @new_tour_travel.parent_id = @tour_travel.id
    end
    if @new_tour_travel.save
      flash[:notice] = "TourTravel successfully created"
      redirect_to @new_tour_travel.is_parent? ? admin_tour_travels_path :
                                                admin_tour_travel_path(@tour_travel.permalink)
    else
      flash[:error] = "TourTravel failed to create<br />Pleace choose the Image"
      render :action => "new"
    end
  end

  def show
    @child_tour_travels = @tour_travel.child_info
  end

  def edit
    unless params[:child_id].nil?
      find_child_tour_travel
      @tour_travel = @child_information
    end
  end

  def update
    params[:tour_travel][:order_no] = Time.now.to_i if params[:tour_travel][:order_no].blank?
    if @tour_travel.update_attributes(params[:tour_travel])
      flash[:notice] = "TourTravel successfully updated"
      redirect_to @tour_travel.is_parent? ? admin_tour_travels_path :
                                            admin_tour_travel_path(@tour_travel.parent_info.permalink)
    else
      flash[:error] = "TourTravel failed to update"
      render :action => "edit"
    end
  end

  def destroy
    flash[:notice] =  @tour_travel.destroy ? ('TourTravel was successfully deleted.') :
                                            ('TourTravel was falied to delete.')
    redirect_to admin_tour_travels_path
  end

  private
    def find_tour_travel
      @tour_travel = TourTravel.find_by_permalink(params[:id])
      if @tour_travel.nil?
        flash[:notice] = "Cannot find the TourTravel with id '#{params[:id]}'"
        redirect_to admin_tour_travels_path
      end
    end

    def find_child_tour_travel
      @child_information = TourTravel.find_by_permalink(params[:child_id])
      if @child_information.nil?
        flash[:notice] = "Cannot find the TourTravel with name '#{params[:child_id].humanize}'"
        redirect_to admin_tour_travels_path
      end
    end
end
