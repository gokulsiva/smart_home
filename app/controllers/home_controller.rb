class HomeController < ApplicationController

  before_action :confirm_logged_in

  layout "home"

  def index
    @main_switch = MainSwitch.first
    if !@main_switch
       redirect_to new_main_switch_path
    end
  end

  def edit
    @switch = MainSwitch.find(params[:id])
    @switch.toggle :control
    @switch.save
    if @switch.control
      system "ruby /home/pi/Sites/smart_home/manual_controller.rb stop"
      system "ruby /home/pi/Sites/smart_home/resetpins.rb"
      system "ruby /home/pi/Sites/smart_home/automatic_controller.rb start"
    else
      system "ruby /home/pi/Sites/smart_home/automatic_controller.rb stop"
      system "ruby /home/pi/Sites/smart_home/resetpins.rb"
      system "ruby /home/pi/Sites/smart_home/manual_controller.rb start"
    end
    redirect_to :action => :index
  end
end
