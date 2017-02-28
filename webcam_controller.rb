command = Thread.new do
  system('ruby /home/pi/Sites/smart_home/process/webcam.rb') # long-long programm
end
command.join
