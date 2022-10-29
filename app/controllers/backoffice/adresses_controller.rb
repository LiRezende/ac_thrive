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