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
