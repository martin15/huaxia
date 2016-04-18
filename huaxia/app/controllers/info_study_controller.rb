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
    if @child_info.permalink.include?("pendaftaran")
      @registration_file = RegistrationFile.new()
    end
  end

  def upload_registration_form
    info = Information.find_by_permalink("study-in-china")
    if params[:child_info].nil?
      @child_info = info.child_info.first
    else
      @child_info = info.child_info.find_by_permalink(params[:child_info])
      redirect_to study_in_china_path if @child_info.nil?
    end
    @list_child_info = info.child_info
    @registration_file = RegistrationFile.new(params[:registration_file])

    if verify_recaptcha
      if @registration_file.save
        flash[:notice] = "File successfully uploaded"
        @info = Information.where("permalink like 'pendaftaran%'")[0]
        if @info.nil?
          redirect_to study_in_china_path
        else
          redirect_to study_in_china_child_info_path(@info.permalink)
        end
      else
        flash[:error] = "File failed uploaded"
        render :action => "index"
      end
    else
      render :action => "index"
    end
  end
end
