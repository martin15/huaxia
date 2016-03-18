class FeaturesController < ApplicationController

  def index
    @program_categories = FeatureCategory.order("order_no")
    @program_category = FeatureCategory.find_by_permalink(params[:category_permalink])
    if @program_category.nil? || params[:category_permalink].nil?
      redirect_to programs_path(@program_categories.first.permalink)
      return
    end
    @programs = @program_category.features
  end

  def show
    @program = Feature.find_by_permalink(params[:permalink])
    if @program.nil?
      redirect_to programs_path
      flash[:error] = "Cannot find News with title '#{params[:permalink].humanize.titleize}'"
    end
  end
end
