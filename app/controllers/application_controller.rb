class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :initializer


  private

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
