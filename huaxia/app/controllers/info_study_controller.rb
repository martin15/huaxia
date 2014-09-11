class InfoStudyController < ApplicationController

  def index
    @info = Information.find_by_permalink(params[:permalink])
    if @info.nil?
      redirect_to root_path
    end
  end
end
