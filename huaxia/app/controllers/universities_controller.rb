class UniversitiesController < ApplicationController

  def index
    #@universities = University.all.group_by{ |h| h.province }
    #@provinces = University.select("DISTINCT province").order("province")
    @provinces = University.select([:province,:city]).group([:province,:city] ).group_by{ |h| h.province }
    @city = params[:city]
    @universities = University.where("city = '#{params[:city]}'")
    if @universities.blank?
      redirect_to root_path
      return
    end
    @province = @universities.first.province
  end

  def show
    @university = University.find_by_city_and_permalink(params[:city], params[:permalink])
    if @university.nil?
      redirect_to root_path
      return
    end
    @university_details = @university.university_details
    @universities_by_city = University.select(
                            [:name, :permalink, :province, :city]).
                            group_by{ |h| h.province }
  end

  def search_result
    @universities = University.where("name like '%#{params[:name]}%'")
    @provinces = University.select([:province,:city]).group([:province,:city] ).group_by{ |h| h.province }
  end
end
