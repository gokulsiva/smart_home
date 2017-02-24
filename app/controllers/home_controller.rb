class HomeController < ApplicationController

  layout "home"

  def index
    @main_switch = MainSwitch.first
    if !@main_switch
       redirect_to new_main_switch_path
    end
  end

  def edit
    @switch = MainSwitch.find(params[:id])
    @switch.toggle :control
    @switch.save
    redirect_to :action => :index
  end
end
