class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :initializer


  private

  def confirm_logged_in
    unless session[:user_id]
        flash[:notice] = "Please Log In"
        redirect_to(login_login_path)
    end
  end

  def initializer
    system "ruby /home/pi/Sites/smart_home/automatic_controller.rb stop"
    system "ruby /home/pi/Sites/smart_home/manual_controller.rb stop"
    system "ruby /home/pi/Sites/smart_home/resetpins.rb"
    switch = MainSwitch.first
    if switch
      if switch.control
        system "ruby /home/pi/Sites/smart_home/automatic_controller.rb start"
      else
        system "ruby /home/pi/Sites/smart_home/manual_controller.rb start"
      end
    end
  end
end
