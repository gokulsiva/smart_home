class MainSwitchesController < ApplicationController
  before_action :set_main_switch, only: [:show, :edit, :update, :destroy]
  layout "switch"

  # GET /main_switches
  # GET /main_switches.json
  def index
    @main_switches = MainSwitch.all
  end

  # GET /main_switches/1
  # GET /main_switches/1.json
  def show
  end

  # GET /main_switches/new
  def new
    @main_switch = MainSwitch.new
  end

  # GET /main_switches/1/edit
  def edit
  end

  # POST /main_switches
  # POST /main_switches.json
  def create
    @main_switch = MainSwitch.new(main_switch_params)

    respond_to do |format|
      if @main_switch.save
        :reset_service
        format.html { redirect_to home_index_path, notice: 'Main switch was successfully created.' }
        format.json { render :show, status: :created, location: @main_switch }
      else
        format.html { render :new }
        format.json { render json: @main_switch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /main_switches/1
  # PATCH/PUT /main_switches/1.json
  def update
    respond_to do |format|
      if @main_switch.update(main_switch_params)
        :reset_service
        format.html { redirect_to @main_switch, notice: 'Main switch was successfully updated.' }
        format.json { render :show, status: :ok, location: @main_switch }
      else
        format.html { render :edit }
        format.json { render json: @main_switch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /main_switches/1
  # DELETE /main_switches/1.json
  def destroy
    @main_switch.destroy
    respond_to do |format|
      format.html { redirect_to main_switches_url, notice: 'Main switch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_switch
      @main_switch = MainSwitch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def main_switch_params
      params.require(:main_switch).permit(:control)
    end

    def reset_service
      system "ruby automatic_controller.rb stop"
      system "ruby manual_controller.rb stop"
      system "ruby resetpins.rb"
      if @main_switch.control
        system "ruby automatic_controller.rb start"
      else
        system "ruby manual_controller.rb start"
      end
    end
end
