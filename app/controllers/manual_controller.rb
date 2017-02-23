class ManualController < ApplicationController
  def index
    @controls = Control.all
  end

  def toggle
    puts Control.find(params[:id]).automated
    @control = Control.find(params[:id])
    @control.toggle :automated
    @control.save
    puts @control.automated
    #@controls = Control.all
    redirect_to :action => :index
  end
end
