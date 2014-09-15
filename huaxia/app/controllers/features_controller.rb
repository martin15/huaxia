class FeaturesController < ApplicationController

  def index
    params[:page] = params[:page].to_i == 0 ? 1 : params[:page]
    @all_news = Feature.paginate(:page => params[:page], :per_page => 2,
                                         :order => "updated_at DESC" )
  end

  def show
    @news = Feature.find_by_id(params[:id])
    if @news.nil?
      redirect_to features_path
      flash[:error] = "Cannot find News with id '#{params[:id]}'"
    end
  end
end
