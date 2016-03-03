class Admin::RoutesController < Admin::ApplicationController
  before_filter :find_airline
  before_filter :find_route, :only => [:show, :destroy, :edit, :update]

  def index
    params[:page] = params[:page].to_i == 0 ? 1 : params[:page] unless params[:page].nil?
    @routes = @airline.routes.paginate(:page => params[:page], :per_page => 10,
                                       :order => "origin" )
    @no = params[:page].nil? ? 0 : (params[:page].to_i-1) * 10
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(params[:route])
    if @route.save
      flash[:notice] = "Route successfully created"
      redirect_to routes_admin_airline_path(@airline.id)
    else
      flash[:error] = "Route failed to create<br />Pleace choose the Image"
      render :action => "new"
    end
  end

  def edit
  end

  def update
    if @route.update_attributes(params[:route])
      flash[:notice] = "Route successfully updated"
      redirect_to routes_admin_airline_path(@airline.id)
    else
      flash[:error] = "Route failed to update"
      render :action => "edit"
    end
  end

  def destroy
    flash[:notice] = @route.destroy ? ('Route was successfully deleted.') :
                                      ('Route was falied to delete.')
    redirect_to routes_admin_airline_path(@airline.id)
  end

  private
    def find_airline
      @airline = Airline.find_by_id(params[:id])
      if @airline.nil?
        flash[:notice] = "Cannot find the Route with id '#{params[:id]}'"
        redirect_to admin_airlines_path
      end
    end

    def find_route
      @route = Route.find_by_id(params[:id_route])
      if @route.nil?
        flash[:notice] = "Cannot find the Route with id '#{params[:id_route]}'"
        redirect_to routes_admin_airline_path(@airline.id)
      end
    end
end
