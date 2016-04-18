class Admin::RegistrationFilesController < Admin::ApplicationController
  before_filter :find_registration_file, :only => [:destroy]

  def index
    params[:page] = params[:page].to_i == 0 ? 1 : params[:page] unless params[:page].nil?
    @registration_files = RegistrationFile.paginate(:page => params[:page], :per_page => 20,
                                         :order => "sender_name" )
    @no = params[:page].nil? ? 0 : (params[:page].to_i-1) * 20
  end

  def destroy
    flash[:notice] = @registration_file.destroy ? ('RegistrationFile was successfully deleted.') :
                                                  ('RegistrationFile was falied to delete.')
    redirect_to admin_registration_files_path
  end

  private
    def find_registration_file
      @registration_file = RegistrationFile.find_by_id(params[:id])
      if @registration_file.nil?
        flash[:notice] = "Cannot find the RegistrationFile with id '#{params[:id]}'"
        redirect_to admin_registration_files_path
      end
    end
end
