class Admin::UniversitiesController < Admin::ApplicationController
  before_filter :find_university, :only => [:show, :destroy, :edit, :update]

  def index
    params[:page] = params[:page].to_i == 0 ? 1 : params[:page] unless params[:page].nil?
    @universities = University.paginate(:page => params[:page], :per_page => 10,
                                         :order => "created_at DESC" )
    @no = params[:page].nil? ? 0 : (params[:page].to_i-1) * 10
  end

  def new
    @university = University.new
  end

  def create
    @university = University.new(params[:university])
    if @university.save
      flash[:notice] = "University successfully created"
      redirect_to admin_universities_path
    else
      flash[:error] = "University failed to create<br />Pleace choose the Image"
      render :action => "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @university.update_attributes(params[:university])
      flash[:notice] = "University successfully updated"
      redirect_to admin_universities_path
    else
      flash[:error] = "University failed to update"
      render :action => "edit"
    end
  end

  def destroy
    flash[:notice] =  @university.destroy ? ('University was successfully deleted.') :
                                            ('University was falied to delete.')
    redirect_to admin_universities_path
  end

  private
    def find_university
      @university = University.find_by_id(params[:id])
      if @university.nil?
        flash[:notice] = "Cannot find the University with id '#{params[:id]}'"
        redirect_to admin_universities_path
      end
    end
end
