class Backoffice::AdressesController < BackofficeController
  before_action :set_adress, only: %i[ show edit update destroy ]
  before_action :set_user

  def index
    @adress = Adress.all
  end
    
  def show
    
  end

  def edit
    
  end

  def update
    adress = Adress.find(params[:id])
    params_adress = params.require(:adress).permit(:street, :number, :complement, :neighborhood, :cep, :city, :state)
    
    if adress.update(params_adress)
      redirect_to backoffice_user_path, notice:
      "Endereço atualizado com sucesso!"
    else
      render :edit
    end
  end

  private
  def set_adress
    @adress = Adress.find(params[:id])
  end

  def set_user
    user_id = params[:user_id]
    @user = User.find(user_id)
  end
end