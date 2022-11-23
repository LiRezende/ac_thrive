class Backoffice::IdiomLevelsController < BackofficeController
  skip_before_action :verify_authenticity_token
  before_action :set_idiom_level, only: %i[ show edit update destroy ]

  # GET /idiom_levels or /idiom_levels.json
  def index
    @idiom_levels = IdiomLevel.all
  end

  # GET /idiom_levels/1 or /idiom_levels/1.json
  def show
  end

  # GET /idiom_levels/new
  def new
    @idiom_level = IdiomLevel.new
  end

  # GET /idiom_levels/1/edit
  def edit
  end

  # POST /idiom_levels or /idiom_levels.json
  def create
    @idiom_level = IdiomLevel.new(idiom_level_params)

    respond_to do |format|
      if @idiom_level.save
        format.html { redirect_to backoffice_idiom_levels_path, notice: "Idiom level was successfully created." }
        format.json { render :show, status: :created, location: @idiom_level }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @idiom_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /idiom_levels/1 or /idiom_levels/1.json
  def update
    respond_to do |format|
      if @idiom_level.update(idiom_level_params)
        format.html { redirect_to backoffice_idiom_level_url(@idiom_level), notice: "Idiom level was successfully updated." }
        format.json { render :show, status: :ok, location: @idiom_level }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @idiom_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /idiom_levels/1 or /idiom_levels/1.json
  def destroy
    @idiom_level.destroy

    respond_to do |format|
      format.html { redirect_to backoffice_idiom_levels_path, notice: "Idiom level was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idiom_level
      @idiom_level = IdiomLevel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def idiom_level_params
      params.require(:idiom_level).permit(:name)
    end
end
