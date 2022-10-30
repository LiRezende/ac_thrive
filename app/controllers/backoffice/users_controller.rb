class Backoffice::UsersController < BackofficeController
  before_action :set_user, only: %i[ show edit update destroy ]
  
  def index
    @users = User.all
  end
    
  def show
    
  end

  def edit
    
  end

  def update
    user = User.find(params[:id])
    params_user = params.require(:user).permit(:email, :password, :password_confirmation)
    
    if user.update(params_user)
      redirect_to backoffice_user_path, notice:
      "Usuário atualizado com sucesso!"
    else
      render :edit
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end