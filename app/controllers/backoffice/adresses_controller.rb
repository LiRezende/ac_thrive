class Backoffice::AdressesController < BackofficeController
  before_action :set_adress, only: %i[ show edit update destroy ]
  before_action :set_user

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
    @adress = Adress.new(adress_params)
    @adress.person_id = @person.id

    if @adress.save
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

  def update
    adress = Adress.find(params[:id])
    params_adress = params.require(:adress).permit(:street, :number, :complement, :neighborhood, :cep, :city, :state)
    
    if adress.update(params_adress)
      if @user == current_user
        redirect_to backoffice_profile_path(current_user)
      else 
        redirect_to "/backoffice/users/#{@user.id}"
      end
      flash[:notice] = "Endereço atualizado com sucesso!"
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

  def set_user
    user_id = params[:user_id]
    @user = User.find(user_id)
    @person = @user.person
    @adress = @person.adress
  end
end
