class Admin::StudentAssociationsController < Admin::ApplicationController
  before_filter :find_student_association, :only => [:show, :destroy, :edit, :update]

  def index
    params[:page] = params[:page].to_i == 0 ? 1 : params[:page] unless params[:page].nil?
    @student_associations = StudentAssociation.paginate(:page => params[:page], :per_page => 10,
                                         :order => "name" )
    @no = params[:page].nil? ? 0 : (params[:page].to_i-1) * 10
  end

  def new
    @student_association = StudentAssociation.new
  end

  def create
    @student_association = StudentAssociation.new(params[:student_association])
    if @student_association.save
      flash[:notice] = "StudentAssociation successfully created"
      redirect_to admin_student_associations_path
    else
      flash[:error] = "StudentAssociation failed to create<br />Pleace choose the Image"
      render :action => "new"
    end
  end

  def edit
  end

  def update
    if @student_association.update_attributes(params[:student_association])
      flash[:notice] = "StudentAssociation successfully updated"
      redirect_to admin_student_associations_path
    else
      flash[:error] = "StudentAssociation failed to update"
      render :action => "edit"
    end
  end

  def destroy
    flash[:notice] =  @student_association.destroy ? ('StudentAssociation was successfully deleted.') :
                                            ('StudentAssociation was falied to delete.')
    redirect_to admin_student_associations_path
  end

  private
    def find_student_association
      @student_association = StudentAssociation.find_by_id(params[:id])
      if @student_association.nil?
        flash[:notice] = "Cannot find the StudentAssociation with name '#{params[:id].humanize.titleize}'"
        redirect_to admin_student_associations_path
      end
    end
end
