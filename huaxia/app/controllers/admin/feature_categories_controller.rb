class Admin::FeatureCategoriesController < Admin::ApplicationController
  before_filter :find_feature_category, :only => [:show, :destroy, :edit, :update]

  def index
    params[:page] = params[:page].to_i == 0 ? 1 : params[:page] unless params[:page].nil?
    @feature_categories = FeatureCategory.order("order_no").paginate(:page => params[:page], :per_page => 10,
                                         :order => "name" )
    @no = params[:page].nil? ? 0 : (params[:page].to_i-1) * 10
  end

  def new
    @feature_category = FeatureCategory.new
  end

  def create
    @feature_category = FeatureCategory.new(params[:feature_category])
    if @feature_category.save
      flash[:notice] = "FeatureCategory successfully created"
      redirect_to admin_feature_categories_path
    else
      flash[:error] = "FeatureCategory failed to create"
      render :action => "new"
    end
  end

  def edit
  end

  def update
    if @feature_category.update_attributes(params[:feature_category])
      flash[:notice] = "FeatureCategory successfully updated"
      redirect_to admin_feature_categories_path
    else
      flash[:error] = "FeatureCategory failed to update"
      render :action => "edit"
    end
  end

  def destroy
    flash[:notice] =  @feature_category.destroy ? ('FeatureCategory was successfully deleted.') :
                                                  ('FeatureCategory was falied to delete.')
    redirect_to admin_feature_categories_path
  end

  private
    def find_feature_category
      @feature_category = FeatureCategory.find_by_id(params[:id])
      if @feature_category.nil?
        flash[:notice] = "Cannot find the FeatureCategory with id '#{params[:id]}'"
        redirect_to admin_feature_categories_path
      end
    end
end
