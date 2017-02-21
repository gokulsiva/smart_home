require '~/Sites/smart_home/config/environment'

loop do
  controls = Control.all
  for control in controls
    puts "Control Name = "+control.name
    puts "Control pin = ", control.pin
    puts "Control Time = ", control.configure
  end
end
