class FeaturesController < ApplicationController

  def index
    @program_categories = FeatureCategory.order("order_no")
    @program_category = FeatureCategory.find_by_permalink(params[:category_permalink])
    if @program_category.nil?
      @program = Feature.find_by_permalink(params[:category_permalink])
      @program_category = @program.feature_category unless @program.nil?
    end
    if @program_category.nil? || params[:category_permalink].nil?
      redirect_to programs_path(@program_categories.first.permalink)
      return
    end
    @programs = @program_category.features
    programs_permalink = @programs.map{|x| x.permalink}
    if programs_permalink.include?("pendaftaran")
      @registration_file = RegistrationFile.new()
    end
  end

  def show
    @program = Feature.find_by_permalink(params[:permalink])
    if @program.nil?
      redirect_to programs_path
      flash[:error] = "Cannot find News with title '#{params[:permalink].humanize.titleize}'"
    end
  end

  def upload_registration_form
    @program_categories = FeatureCategory.order("order_no")
    @program_category = FeatureCategory.find_by_permalink(params[:category_permalink])
    if @program_category.nil? || params[:category_permalink].nil?
      redirect_to programs_path(@program_categories.first.permalink)
      return
    end
    @programs = @program_category.features
    @program = @programs.where("permalink like '%pendaftaran%'")[0]
    @registration_file = RegistrationFile.new(params[:registration_file])

    if verify_recaptcha
      if @registration_file.save
        flash[:notice] = "Registrasi berhasil dilakukan"
        RegistrationConfirmationMailer.after_registration(@registration_file, the_domain).deliver_now
        unless @program_category.nil?
          redirect_to programs_path(@program_category.permalink)
        else
          redirect_to programs_path(@program_categories.first.permalink)
        end
      else
        flash[:error] = "Registrasi gagal dilakukan"
        render :action => "index"
      end
    else
      render :action => "index"
    end
  end
end
