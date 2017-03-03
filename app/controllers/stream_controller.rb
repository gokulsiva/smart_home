require 'socket'

class StreamController < ApplicationController

  before_action :confirm_logged_in

  def index
    ip = Socket.ip_address_list.detect{|intf| intf.ipv4_private?}
    @ip = ip.ip_address
  end
end
