class AboutUsController < ApplicationController

  def index
    about_us = Information.find_by_permalink("about_us")
    if about_us.nil?
      redirect_to root_path
      return
    end
    if params[:child_info].nil?
      @child_info = about_us.child_info.first
    else
      @child_info = about_us.child_info.find_by_permalink(params[:child_info])
      redirect_to info_path('registration') if @child_info.nil?
    end
    @list_child_info = about_us.child_info
  end
end
