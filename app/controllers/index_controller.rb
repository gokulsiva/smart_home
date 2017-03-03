class IndexController < ApplicationController

  before_action :confirm_logged_in

  layout "index"

  def index
    @username = session[:username]
  end

end
