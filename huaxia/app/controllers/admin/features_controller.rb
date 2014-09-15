class Admin::FeaturesController < Admin::ApplicationController
  before_filter :find_feature, :only => [:destroy, :edit, :update]

  def index
    params[:page] = params[:page].to_i == 0 ? 1 : params[:page]
    @features = Feature.paginate(:page => params[:page], :per_page => 5,
                                         :order => "updated_at DESC" )
    @no = params[:page].to_i * 5
  end

  def new
    @feature = Feature.new
  end

  def create
    @feature = Feature.new(params[:feature])
    if @feature.save
      flash[:notice] = "Feature successfully created"
      redirect_to admin_features_path
    else
      flash[:error] = "Feature failed to create<br />Pleace choose the Image"
      render :action => "new"
    end
  end

  def edit
  end

  def update
    puts "----------------"
    if @feature.update_attributes(params[:feature])
      flash[:notice] = "Feature successfully updated"
      redirect_to admin_features_path
    else
      flash[:error] = "Feature failed to update"
      render :action => "edit"
    end
  end

  def destroy
    flash[:notice] =  @feature.destroy ? 'Feature was successfully deleted.' : 'Feature was falied to delete.'
    redirect_to admin_features_path
  end

  private
    def find_feature
      @feature = Feature.find_by_id(params[:id])
      if @feature.nil?
        flash[:notice] = "Cannot find the Feature with id '#{params[:id]}'"
        redirect_to admin_features_path
      end
    end
end
