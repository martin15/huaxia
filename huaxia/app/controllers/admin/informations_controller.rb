class Admin::InformationsController < Admin::ApplicationController
  before_filter :find_information, :only => [:show, :edit, :update, :destroy]

  def index
    params[:page] = params[:page].to_i == 0 ? 1 : params[:page] unless params[:page].nil?
    @informations = Information.where("permalink != 'book_note' AND parent_id is null").
                                paginate(:page => params[:page], :per_page => 10,
                                         :order => "title" )
    @no = params[:page].nil? ? 0 : (params[:page].to_i-1) * 10
  end

  def show
    redirect_to admin_informations_path if !@information.permalink.include?("step-by-step") && !@information.is_parent?
    @child_informations = @information.child_info
  end

  def new
    @information = Information.new
  end

  def create
    @new_information = Information.new(params[:information])
    @new_information.order_no = Time.now.to_i if @new_information.order_no.blank?
    unless params[:id].nil?
      find_information
      @new_information.parent_id = @information.id
    end
    if @new_information.save
      flash[:notice] = "Information successfully created"
       @new_information.is_parent? ? (redirect_to admin_informations_path) :
                                     (redirect_to admin_information_path(@information.permalink))
    else
      flash[:error] = "Information failed to create"
      render :action => "new"
    end
  end

  def edit
    unless params[:child_id].nil?
      find_child_information
      @information = @child_information
    end
  end

  def update
    puts params[:information][:order_no].blank?
    puts "----"
    params[:information][:order_no] = Time.now.to_i if params[:information][:order_no].blank?
    if @information.update_attributes(params[:information])
      flash[:notice] = "#{params[:id].humanize} successfully updated."
      if @information.permalink == 'book_note'
        redirect_to admin_books_path
        return
      end
      @information.is_parent? ? (redirect_to admin_informations_path) :
                                (redirect_to admin_information_path(@information.parent_info.permalink))
    else
      flash[:error] = "#{params[:id].humanize} was failed to update."
      render :action => "edit"
    end
  end

  def destroy
    destination = @information.is_parent? ? (admin_informations_path) :
                                            (admin_information_path(@information.parent_info.permalink))
    flash[:notice] =  @information.destroy ? ('Information was successfully deleted.') :
                                            ('Information was falied to delete.')
    redirect_to destination
  end

  private
    def find_information
      @information = Information.find_by_permalink(params[:id])
      if @information.nil?
        flash[:notice] = "Cannot find the Information with name '#{params[:id].humanize}'"
        redirect_to admin_informations_path
      end
      unless params[:child_id].nil?
        find_child_information
        @information = @child_information
      end
    end

    def find_child_information
      @child_information = Information.find_by_permalink(params[:child_id])
      if @child_information.nil?
        flash[:notice] = "Cannot find the Information with name '#{params[:child_id].humanize}'"
        redirect_to admin_informations_path
      end
    end
end
