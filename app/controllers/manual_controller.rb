class ManualController < ApplicationController
  def index
    @controls = Control.all
  end

  def toggle
    control = Control.find(params[:id])
    control.toggle :automated
  end
end
