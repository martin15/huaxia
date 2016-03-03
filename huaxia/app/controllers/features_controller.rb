class FeaturesController < ApplicationController

  def index
    @program_categories = FeatureCategory.all
  end

  def show
    @program = Feature.find_by_permalink(params[:permalink])
    if @program.nil?
      redirect_to programs_path
      flash[:error] = "Cannot find News with title '#{params[:permalink].humanize.titleize}'"
    end
  end
end
