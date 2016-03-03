class Admin::UploadedFilesController < Admin::ApplicationController
  before_filter :find_uploaded_file, :only => [:show, :destroy, :edit, :update]

  def index
    params[:page] = params[:page].to_i == 0 ? 1 : params[:page] unless params[:page].nil?
    @uploaded_files = UploadedFile.paginate(:page => params[:page], :per_page => 10,
                                         :order => "name" )
    @no = params[:page].nil? ? 0 : (params[:page].to_i-1) * 10
  end

  def new
    @uploaded_file = UploadedFile.new
  end

  def create
    @uploaded_file = UploadedFile.new(params[:uploaded_file])
    if @uploaded_file.save
      flash[:notice] = "UploadedFile successfully created"
      redirect_to admin_uploaded_files_path
    else
      flash[:error] = "UploadedFile failed to create<br />Pleace choose the Image"
      render :action => "new"
    end
  end

  def edit
  end

  def update
    if @uploaded_file.update_attributes(params[:uploaded_file])
      flash[:notice] = "UploadedFile successfully updated"
      redirect_to admin_uploaded_files_path
    else
      flash[:error] = "UploadedFile failed to update"
      render :action => "edit"
    end
  end

  def destroy
    flash[:notice] = @uploaded_file.destroy ? ('UploadedFile was successfully deleted.') :
                                        ('UploadedFile was falied to delete.')
    redirect_to admin_uploaded_files_path
  end

  private
    def find_uploaded_file
      @uploaded_file = UploadedFile.find_by_id(params[:id])
      if @uploaded_file.nil?
        flash[:notice] = "Cannot find the UploadedFile with id '#{params[:id]}'"
        redirect_to admin_uploaded_files_path
      end
    end
end
