class Backoffice::FinancialResponsiblesController < BackofficeController
  before_action :set_financial_responsible, only: %i[ show edit update destroy ]
  before_action :set_user

  # GET /financial_responsibles or /financial_responsibles.json
  def index
    @financial_responsibles = FinancialResponsible.all
  end

  # GET /financial_responsibles/1 or /financial_responsibles/1.json
  def show
  end

  # GET /financial_responsibles/new
  def new
    @financial_responsible = FinancialResponsible.new
  end

  # GET /financial_responsibles/1/edit
  def edit
  end

  def create
    @financial_responsible = FinancialResponsible.new(financial_responsible_params)
    @financial_responsible.person_id = @person.id

    if @financial_responsible.save
      if @user == current_user
        redirect_to backoffice_profile_path(current_user)
      else
        redirect_to "/backoffice/users/#{@user.id}"
      end
      flash[:notice] = "Endereço cadastrado com sucesso!"  
    else
      render :create
    end
  end

  # PATCH/PUT /financial_responsibles/1 or /financial_responsibles/1.json
  def update
    respond_to do |format|
      if @financial_responsible.update(financial_responsible_params)
        format.html { redirect_to "/backoffice/users/#{@user.id}", notice: "Financial responsible was successfully updated." }
        format.json { render :show, status: :ok, location: @financial_responsible }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @financial_responsible.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /financial_responsibles/1 or /financial_responsibles/1.json
  def destroy
    @financial_responsible.destroy

    respond_to do |format|
      format.html { redirect_to financial_responsibles_url, notice: "Financial responsible was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_financial_responsible
      @financial_responsible = FinancialResponsible.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def financial_responsible_params
      params.require(:financial_responsible).permit(:first_name, :last_name, :phone, :email, :cpf)
    end

    def set_user
      user_id = params[:user_id]
      @user = User.find(user_id)
      @person = @user.person
      @financial_responsible = @person.financial_responsible
    end
end
