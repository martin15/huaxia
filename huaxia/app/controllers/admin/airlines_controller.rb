class Admin::AirlinesController < Admin::ApplicationController
  before_filter :find_airline, :only => [:show, :destroy, :edit, :update]

  def index
    params[:page] = params[:page].to_i == 0 ? 1 : params[:page] unless params[:page].nil?
    @airlines = Airline.paginate(:page => params[:page], :per_page => 10,
                                         :order => "name" )
    @no = params[:page].nil? ? 0 : (params[:page].to_i-1) * 10
  end

  def new
    @airline = Airline.new
  end

  def create
    @airline = Airline.new(params[:airline])
    if @airline.save
      flash[:notice] = "Airline successfully created"
      redirect_to admin_airlines_path
    else
      flash[:error] = "Airline failed to create<br />Pleace choose the Image"
      render :action => "new"
    end
  end

  def edit
  end

  def update
    if @airline.update_attributes(params[:airline])
      flash[:notice] = "Airline successfully updated"
      redirect_to admin_airlines_path
    else
      flash[:error] = "Airline failed to update"
      render :action => "edit"
    end
  end

  def destroy
    flash[:notice] = @airline.destroy ? ('Airline was successfully deleted.') :
                                        ('Airline was falied to delete.')
    redirect_to admin_airlines_path
  end

  private
    def find_airline
      @airline = Airline.find_by_id(params[:id])
      if @airline.nil?
        flash[:notice] = "Cannot find the Airline with id '#{params[:id]}'"
        redirect_to admin_airlines_path
      end
    end
end
