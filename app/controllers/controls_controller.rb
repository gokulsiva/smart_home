class ControlsController < ApplicationController
  before_action :set_control, only: [:show, :edit, :update, :destroy]
  before_action :load_pins, only: [:new, :create, :edit, :update]

  # GET /controls
  # GET /controls.json
  def index
    @controls = Control.all
  end

  # GET /controls/1
  # GET /controls/1.json
  def show
  end

  # GET /controls/new
  def new
    @control = Control.new
  end

  # GET /controls/1/edit
  def edit
  end

  # POST /controls
  # POST /controls.json
  def create
    @control = Control.new(control_params)

    respond_to do |format|
      if @control.save
        format.html { redirect_to @control, notice: 'Control was successfully created.' }
        format.json { render :show, status: :created, location: @control }
      else
        format.html { render :new }
        format.json { render json: @control.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /controls/1
  # PATCH/PUT /controls/1.json
  def update
    respond_to do |format|
      if @control.update(control_params)
        format.html { redirect_to @control, notice: 'Control was successfully updated.' }
        format.json { render :show, status: :ok, location: @control }
      else
        format.html { render :edit }
        format.json { render json: @control.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /controls/1
  # DELETE /controls/1.json
  def destroy
    @control.destroy
    respond_to do |format|
      format.html { redirect_to controls_url, notice: 'Control was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_control
      @control = Control.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def control_params
      params.require(:control).permit(:name, :pin, :configure, :configureoff, :automated)
    end

    # Load existing pins to remove it from creating and editing
    def load_pins
        objects = Control.all
        pins = [ 4, 5, 6, 12, 13, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27 ]
        existing_pins = []
        if objects
          for obj in objects
            existing_pins.push(obj.pin)
          end
        end
        @pins = (pins - existing_pins)
        if params[:action] == 'edit' || params[:action] == 'update'
          controller = Control.find(params[:id])
          @pins.push(controller.pin)
        end
        @pins = @pins.sort
    end

end
