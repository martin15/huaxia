class InfoStudyController < ApplicationController

  def index
    info = Information.find_by_permalink("study-in-china")
    if info.nil?
      redirect_to root_path
      return
    end
    if params[:child_info].nil?
      @child_info = info.child_info.first
    else
      @child_info = info.child_info.find_by_permalink(params[:child_info])
      redirect_to study_in_china_path if @child_info.nil?
    end
    @list_child_info = info.child_info
  end
end
