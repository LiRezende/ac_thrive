class Backoffice::AdressesController < BackofficeController
  before_action :set_adress, only: %i[ show edit update destroy ]

  def index
    @adress = Adress.all
  end
    
  def show
    
  end

  def new
    @adress = Adress.new
  end

  def edit
    
  end

  def create
    @adress = current_user.adress.build(adress_params)

    if @adress.save
      redirect_to backoffice_profile_adress_path
    else
      render :create
    end
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
  def adress_params
    params_adress = params.require(:adress).permit(:street, :number, :complement, :neighborhood, :cep, :city, :state)
  end

  def set_adress
    @adress = Adress.find(params[:id])
  end

  def set_person
    person_id = params[:person_id]
    person_id ||= current_user.id
    @person = Person.find(person_id)
  end

  def set_user
    user_id = params[:user_id]
    @user = User.find(user_id)
  end
end