class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :reload_data

  def reload_data
    @informations = Information.showed_informations
    @temp_info = @informations.first
    @universities = University.all.in_groups(4, false)
    @temp_univ = @universities.empty? ? nil : @universities.first.first
  end

end
