require File.expand_path('/home/pi/Sites/smart_home/config/environment', __FILE__)

command = Thread.new do
  system('ruby /home/pi/Sites/smart_home/automatic_controller.rb stop') # long-long programm
end
command.join

puts "Automatic controller stopped."

command = Thread.new do
  system('ruby /home/pi/Sites/smart_home/manual_controller.rb stop') # long-long programm
end
command.join

puts "Manual controller controller stopped."

command = Thread.new do
  system('ruby /home/pi/Sites/smart_home/resetpins.rb') # long-long programm
end
command.join

puts "Pins resetted"

switch = MainSwitch.first
if switch
  if switch.control
    command = Thread.new do
      system('ruby /home/pi/Sites/smart_home/automatic_controller.rb start') # long-long programm
    end
    command.join
    puts "Automattic controller started"
  else
    command = Thread.new do
      system('ruby /home/pi/Sites/smart_home/manual_controller.rb start') # long-long programm
    end
    command.join
    puts "Manual controller started"
  end
end
command = Thread.new do
  system('ruby /home/pi/Sites/smart_home/webcam_controller.rb') # long-long programm
end
command.join
puts "Web cam controller started"
