require File.expand_path('/home/pi/Sites/smart_home/config/environment', __FILE__)

loop do
  controls = Control.all
  for control in controls
    if control.configure.strftime("at %I:%M%p") == Time.now.strftime("at %I:%M%p")
      system "gpio -g mode #{control.pin} out"
      system "gpio -g write #{control.pin} 1"
    end

    if control.configureoff.strftime("at %I:%M%p") == Time.now.strftime("at %I:%M%p")
      system "gpio -g mode #{control.pin} out"
      system "gpio -g write #{control.pin} 0"
    end

  end
end
