class TourTravelsController < ApplicationController
  before_filter :find_tour_and_travel

  def index
    if params[:child_info].nil?
      @child_info = @tour_and_travel.child_info.first
    else
      if params[:child_info] == "tiket-pesawat"
        @child_info = @tour_and_travel.child_info.find_by_permalink(params[:child_info])
        @airlines = Airline.order("name")
      else
        @child_info = @tour_and_travel.child_info.find_by_permalink(params[:child_info])
        if @child_info.nil?
          redirect_to info_path('tour_travels')
          return
        end
      end
    end
    @list_child_info = @tour_and_travel.child_info
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
