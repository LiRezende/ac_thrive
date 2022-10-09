class ClassDaysController < ApplicationController
  before_action :set_class_day, only: %i[ show edit update destroy ]

  # GET /class_days or /class_days.json
  def index
    @class_days = ClassDay.all
  end

  # GET /class_days/1 or /class_days/1.json
  def show
  end

  # GET /class_days/new
  def new
    @class_day = ClassDay.new
  end

  # GET /class_days/1/edit
  def edit
  end

  # POST /class_days or /class_days.json
  def create
    @class_day = ClassDay.new(class_day_params)

    respond_to do |format|
      if @class_day.save
        format.html { redirect_to class_day_url(@class_day), notice: "Class day was successfully created." }
        format.json { render :show, status: :created, location: @class_day }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @class_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_days/1 or /class_days/1.json
  def update
    respond_to do |format|
      if @class_day.update(class_day_params)
        format.html { redirect_to class_day_url(@class_day), notice: "Class day was successfully updated." }
        format.json { render :show, status: :ok, location: @class_day }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @class_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_days/1 or /class_days/1.json
  def destroy
    @class_day.destroy

    respond_to do |format|
      format.html { redirect_to class_days_url, notice: "Class day was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_day
      @class_day = ClassDay.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def class_day_params
      params.require(:class_day).permit(:name)
    end
end
