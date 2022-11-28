class Backoffice::IdiomsController < BackofficeController
  skip_before_action :verify_authenticity_token
  before_action :set_idiom, only: %i[ show edit update destroy ]

  def index
    @idioms = policy_scope(Idiom.all)
  end

  def show
  end

  def new
    @idiom = Idiom.new
    authorize @idiom
  end

  def edit
  end

  def create
    @idiom = Idiom.new(idiom_params)
    authorize @idiom
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

  def update
    respond_to do |format|
      if @idiom.update(idiom_params)
        format.html { redirect_to backoffice_idioms_path, notice: "Idioma atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @idiom }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @idiom.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @idiom.destroy

    respond_to do |format|
      format.html { redirect_to backoffice_idioms_path, notice: "Idioma excluído com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    def set_idiom
      @idiom = Idiom.find(params[:id])
      authorize @idiom
    end

    def idiom_params
      params.require(:idiom).permit(:name)
    end
end
