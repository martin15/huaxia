class Admin::FeaturesController < Admin::ApplicationController
  before_filter :find_feature, :only => [:destroy, :edit, :update, :show]

  def index
    params[:page] = params[:page].to_i == 0 ? 1 : params[:page] unless params[:page].nil?

    if params[:category].nil?
      @features = Feature.paginate(:page => params[:page], :per_page => 10,
                                         :order => "updated_at DESC" )
    else
      @category = FeatureCategory.find_by_permalink(params[:category])
      if @category.nil?
        redirect_to admin_features_path
        return
      end
      @features = @category.features.paginate(:page => params[:page], :per_page => 10,
                                         :order => "order_no" )
    end
    @no = params[:page].nil? ? 0 : (params[:page].to_i-1) * 10
  end

  def new
    @feature = Feature.new
  end

  def show
    redirect_to admin_features_path if !@feature.permalink.include?("step-by-step") && @feature.is_parent?
    @child_features = @feature.child_features
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
    puts params.inspect
    if @feature.update_attributes(params[:feature])
      if params[:feature][:delete_image].to_i == 1 && @feature.feature_image.file?
        @feature.feature_image.destroy
        @feature.save
      end
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

  def destroy_image
    
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
