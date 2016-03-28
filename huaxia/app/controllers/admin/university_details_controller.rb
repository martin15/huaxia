class Admin::UniversityDetailsController < Admin::ApplicationController
  before_filter :find_university
  before_filter :find_university_detail, :only => [:destroy, :edit, :update]

  def index
    params[:page] = params[:page].to_i == 0 ? 1 : params[:page] unless params[:page].nil?
    @university_details = @university.university_details.paginate(:page => params[:page], :per_page => 20,
                                         :order => "order_no" )
    @no = params[:page].nil? ? 0 : (params[:page].to_i-1) * 20
  end

  def new
    @university_detail = UniversityDetail.new
  end

  def create
    @university_detail = UniversityDetail.new(params[:university_detail])
    @university_detail.university = @university
    if @university_detail.save
      flash[:notice] = "UniversityDetail successfully created"
      redirect_to admin_university_university_details_path(@university)
    else
      flash[:error] = "UniversityDetail failed to create<br />Pleace choose the Image"
      render :action => "new"
    end
  end

  def edit
  end

  def update
    if @university_detail.update_attributes(params[:university_detail])
      flash[:notice] = "UniversityDetail successfully updated"
      redirect_to admin_university_university_details_path(@university)
    else
      flash[:error] = "UniversityDetail failed to update"
      render :action => "edit"
    end
  end

  def destroy
    flash[:notice] =  @university_detail.destroy ? ('UniversityDetail was successfully deleted.') :
                                            ('UniversityDetail was falied to delete.')
    redirect_to admin_university_university_details_path(@university)
  end

  private
    def find_university_detail
      @university_detail = UniversityDetail.find_by_id(params[:id])
      if @university_detail.nil?
        flash[:notice] = "Cannot find the UniversityDetail with id '#{params[:id]}'"
        redirect_to admin_university_university_details_path(@university)
      end
    end

   def find_university
      @university = University.find_by_id(params[:university_id])
      if @university.nil?
        flash[:notice] = "Cannot find the University with id '#{params[:university_id]}'"
        redirect_to admin_universities_path
      end
    end
end
