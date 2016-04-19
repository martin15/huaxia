class RegistrationConfirmationMailer < ActionMailer::Base
  def after_registration(user, domain)
    @user = user
    @domain = domain
    mail(:to => "huaxia.icec@gmail.com", :subject => "[HuaXia ICEC] Registration") do |format|
      format.html
    end
  end
end
