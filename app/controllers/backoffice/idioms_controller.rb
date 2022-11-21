class Backoffice::IdiomsController < BackofficeController
  before_action :set_idiom, only: %i[ show edit update destroy ]

  # GET /idioms or /idioms.json
  def index
    @idioms = Idiom.all
  end

  # GET /idioms/1 or /idioms/1.json
  def show
  end

  # GET /idioms/new
  def new
    @idiom = Idiom.new
  end

  # GET /idioms/1/edit
  def edit
  end

  # POST /idioms or /idioms.json
  def create
    @idiom = Idiom.new(idiom_params)

    respond_to do |format|
      if @idiom.save
        format.html { redirect_to backoffice_idioms_path, notice: "Idioma cadastrado com sucesso." }
        format.json { render :show, status: :created, location: @idiom }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @idiom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /idioms/1 or /idioms/1.json
  def update
    respond_to do |format|
      if @idiom.update(idiom_params)
        format.html { redirect_to backoffice_idioms_path, notice: "Idiom was successfully updated." }
        format.json { render :show, status: :ok, location: @idiom }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @idiom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /idioms/1 or /idioms/1.json
  def destroy
    @idiom.destroy

    respond_to do |format|
      format.html { redirect_to backoffice_idioms_path, notice: "Idiom was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idiom
      @idiom = Idiom.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def idiom_params
      params.require(:idiom).permit(:name)
    end
end
