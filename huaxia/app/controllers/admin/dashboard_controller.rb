class Admin::DashboardController < Admin::ApplicationController
  def index
    @user = current_user
  end

  def change_password
    puts params.inspect
    @user = User.authenticate(params[:user][:email], params[:user][:old_password])
    if @user
      puts params[:user]
      if @user.update_attributes(params[:user])
        flash[:notice] = "Password successfully changed"
      else
        flash[:error] = "Password failed to change"
      end
    else
      flash[:error] = "Your Old Password is invalid"
    end
    redirect_to admin_path
  end
end
