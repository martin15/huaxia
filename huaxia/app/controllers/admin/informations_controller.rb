class Admin::InformationsController < Admin::ApplicationController
  before_filter :find_information, :only => [:edit, :update]

  def index
    @informations = Information.all
  end

  def edit
  end

  def update
    if @information.update_attributes(params[:information])
      flash[:notice] = "#{params[:id].humanize} successfully updated."
      redirect_to admin_informations_path
    else
      flash[:error] = "#{params[:id].humanize} was failed to update."
      render :action => "edit"
    end
  end

  private
    def find_information
      @information = Information.find_by_title(params[:id])
      if @information.nil?
        flash[:notice] = "Cannot find the ContentSetting with key '#{params[:id].humanize}'"
        redirect_to admin_informations_path
      end
    end
end
