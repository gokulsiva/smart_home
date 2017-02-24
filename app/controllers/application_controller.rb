class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :initialsetup


  private

  def initialsetup
    system "ruby automatic_controller.rb stop"
    system "ruby manual_controller.rb stop"
    system "ruby resetpins.rb"
    switch = MainSwitch.first
    if switch
      if switch.control
        system "ruby automatic_controller.rb start"
      else
        system "ruby manual_controller.rb start"
      end
    end
  end

end
