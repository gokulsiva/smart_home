require File.expand_path('/home/pi/Sites/smart_home/config/environment', __FILE__)

loop do
  controls = Control.all
  for control in controls
   system "gpio -g mode #{control.pin} out"
   if control.automated
	system "gpio -g write #{control.pin} 1"
   else
	system "gpio -g write #{control.pin} 0"
  end
  end
end
