class Admin::InformationsController < Admin::ApplicationController
  before_filter :find_information, :only => [:edit, :update, :destroy]

  def index
    params[:page] = params[:page].to_i == 0 ? 1 : params[:page] unless params[:page].nil?
    @informations = Information.where("permalink != 'book_note'").
                                paginate(:page => params[:page], :per_page => 10,
                                         :order => "created_at DESC" )
    @no = params[:page].nil? ? 0 : (params[:page].to_i-1) * 10
  end

#  def new
#    @information = Information.new
#  end
#
#  def create
#    @information = Information.new(params[:information])
#    if @information.save
#      flash[:notice] = "Information successfully created"
#      redirect_to admin_informations_path
#    else
#      flash[:error] = "Information failed to create"
#      render :action => "new"
#    end
#  end

  def edit
  end

  def update
    if @information.update_attributes(params[:information])
      flash[:notice] = "#{params[:id].humanize} successfully updated."
      if @information.permalink == 'book_note'
        redirect_to admin_books_path
        return
      end
      redirect_to admin_informations_path
    else
      flash[:error] = "#{params[:id].humanize} was failed to update."
      render :action => "edit"
    end
  end

  def destroy
    flash[:notice] =  @information.destroy ? ('Information was successfully deleted.') :
                                            ('Information was falied to delete.')
    redirect_to admin_informations_path
  end

  private
    def find_information
      @information = Information.find_by_permalink(params[:id])
      if @information.nil?
        flash[:notice] = "Cannot find the Information with name '#{params[:id].humanize}'"
        redirect_to admin_informations_path
      end
    end
end
