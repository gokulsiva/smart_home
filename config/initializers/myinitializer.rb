require File.expand_path('/home/pi/Sites/smart_home/config/environment', __FILE__)
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
