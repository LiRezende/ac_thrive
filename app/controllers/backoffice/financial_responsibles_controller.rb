class Backoffice::FinancialResponsiblesController < BackofficeController
  skip_before_action :verify_authenticity_token
  before_action :set_financial_responsible, only: %i[ show edit update destroy ]
  before_action :set_user

  def index
    @financial_responsibles = FinancialResponsible.all
  end

  def show
  end

  def new
    @financial_responsible = FinancialResponsible.new
    if !current_user.has_role?(:Administrador) && @person.id != current_user.person.id
      flash[:error] = 'Você não tem permissão para fazer esta ação.'
      redirect_to "/backoffice/home/index"
    end
  end

  def edit
    if !current_user.has_role?(:Administrador) && @person.id != current_user.person.id
      flash[:error] = 'Você não tem permissão para fazer esta ação.'
      redirect_to "/backoffice/home/index"
    end
  end

  def create
    @financial_responsible = FinancialResponsible.new(financial_responsible_params)

    if current_user.has_role?(:Administrador) 
      @financial_responsible.person_id = @person.id
    else
      @financial_responsible.person_id = current_user.person.id
    end

    if @financial_responsible.save
      if @user == current_user
        redirect_to backoffice_profile_path(current_user)
      else
        redirect_to "/backoffice/users/#{@user.id}"
      end
      flash[:notice] = "Responsável financeiro cadastrado com sucesso!"  
    else
      render :create
    end
  end

  def update
    financial_responsible = FinancialResponsible.find(params[:id])
    params_financial_responsible = params.require(:financial_responsible).permit(:first_name, :last_name, :phone, :email, :cpf)
    
    if financial_responsible.update(params_financial_responsible)
      if @user == current_user
        redirect_to backoffice_profile_path(current_user)
      else 
        redirect_to "/backoffice/users/#{@user.id}"
      end
      flash[:notice] = "Responsável financeiro atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @financial_responsible.destroy

    respond_to do |format|
      format.html { redirect_to "/backoffice/users/#{@user.id}", notice: "Financial responsible was successfully destroyed." }
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
