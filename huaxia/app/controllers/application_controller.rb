class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :reload_data
  before_filter :params_validation

  def params_validation
    unless params[:page].to_s != "0" && (params[:page].nil? || /^\d+$/ =~ params[:page])
      respond_to do |format|
        format.html { render :file => "#{Rails.root}/public/404",
                             :layout => false, :status => :not_found }
      end
    end
  end

  def reload_data
    @informations = Information.showed_informations
    @temp_info = @informations.first
    @universities = University.all.in_groups(4, false)
    @temp_univ = @universities.empty? ? nil : @universities.first.first
  end

end
