class UniversitiesController < ApplicationController

  def show
    @university = University.find_by_permalink(params[:permalink])
    if @university.nil?
      redirect_to root_path
    end
    @universities_by_city = University.select(
                            [:name, :permalink, :province, :city]).
                            group_by{ |h| h.province }
  end
end
