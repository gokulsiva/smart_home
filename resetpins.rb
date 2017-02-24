require File.expand_path('/home/pi/Sites/smart_home/config/environment', __FILE__)

controls = Control.all
for control in controls
system "gpio -g write #{control.pin} 0"
end
end
