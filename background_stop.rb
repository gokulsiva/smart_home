require 'open3'

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

command = Thread.new do
  stdout, stdeerr, status = Open3.capture3("ps -ef | grep 'vlc'")
  ps_length = stdout.strip.split(/\s+/)
  begin
  if stdout && stdout != ''
  stdout, stdeerr, status = Open3.capture3("ps -ef | grep 'vlc'")
  ps = stdout.strip.split(/\s+/)
  if not ps.length > 24
  break
  end
  pid = ps[1]
  system "kill #{pid}"
  puts "Terminated vlc"
  end
  end while ps_length.length > 24
end
command.join

puts "WebCam controller stopped"
