require 'pi_piper'
include PiPiPer
require '~/Sites/smart_home/config/environment'


loop do
  controls = Control.all
  for control in controls
    pin = PiPiper::Pin.new(:pin => control.pin, :direction => :out)
    if control.automated
      pin.on
    else
      pin.off
    end
  end
end
