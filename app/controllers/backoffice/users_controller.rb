class Backoffice::UsersController < BackofficeController
  def index
    @users = User.all
  end
    
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id]) 
  end

  def update
    user = User.find(params[:id])
    params_user = params.require(:user).permit(:email, :password, :password_confirmation)
    
    if user.update(params_user)
      redirect_to 'backoffice/users#index', notice:
      "Usuário atualizado com sucesso!"
    else
      render :edit
    end
  end
end