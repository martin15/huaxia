class TourTravelsController < ApplicationController
  before_filter :find_tour_and_travel

  def index
    if params[:child_info].nil?
      @tour_travel = TourTravel.order("order_no").first
    else
      @tour_travel = TourTravel.find_by_permalink(params[:child_info])
      if params[:child_info] == "tiket-pesawat"
        @airlines = Airline.order("name")
      else
        if @tour_travel.nil?
          redirect_to tour_travel_path
          return
        end
      end
    end
    @tour_travels = TourTravel.parent_tour_travel
  end

  def airline_detail
    if params[:child_info] == "tiket-pesawat"
      @child_info = @tour_and_travel.child_info.find_by_permalink(params[:child_info])

      @airline = Airline.find_by_permalink(params[:airline])
      if @airline.nil?
        redirect_to info_path('tour_travels')
        return
      end
    else
      redirect_to info_path('tour_travels')
      return
    end
    @list_child_info = @tour_and_travel.child_info
  end

  def search_result
    @child_info = @tour_and_travel.child_info.find_by_permalink("tiket-pesawat")
    @routes = Route.where("origin = '#{params[:origin]}' AND destination = '#{params[:destination]}'")
    @list_child_info = @tour_and_travel.child_info
  end

  private
    def find_tour_and_travel
      @tour_and_travel = Information.find_by_permalink("tour-and-travel")
      if @tour_and_travel.nil?
        redirect_to root_path
        return
      end
    end
end
