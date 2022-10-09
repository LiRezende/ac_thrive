class ClassHoursController < ApplicationController
  before_action :set_class_hour, only: %i[ show edit update destroy ]

  # GET /class_hours or /class_hours.json
  def index
    @class_hours = ClassHour.all
  end

  # GET /class_hours/1 or /class_hours/1.json
  def show
  end

  # GET /class_hours/new
  def new
    @class_hour = ClassHour.new
  end

  # GET /class_hours/1/edit
  def edit
  end

  # POST /class_hours or /class_hours.json
  def create
    @class_hour = ClassHour.new(class_hour_params)

    respond_to do |format|
      if @class_hour.save
        format.html { redirect_to class_hour_url(@class_hour), notice: "Class hour was successfully created." }
        format.json { render :show, status: :created, location: @class_hour }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @class_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_hours/1 or /class_hours/1.json
  def update
    respond_to do |format|
      if @class_hour.update(class_hour_params)
        format.html { redirect_to class_hour_url(@class_hour), notice: "Class hour was successfully updated." }
        format.json { render :show, status: :ok, location: @class_hour }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @class_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_hours/1 or /class_hours/1.json
  def destroy
    @class_hour.destroy

    respond_to do |format|
      format.html { redirect_to class_hours_url, notice: "Class hour was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_hour
      @class_hour = ClassHour.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def class_hour_params
      params.require(:class_hour).permit(:description, :class_day_id)
    end
end
