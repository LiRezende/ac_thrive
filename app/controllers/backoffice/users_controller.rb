class Backoffice::UsersController < BackofficeController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :verify_password, only: [:update]
  
  def index
    @users = User.all.page(params[:page]).per(3)
  end
    
  def show
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to backoffice_users_path, notice:
      "Usuário cadastrado com sucesso!"
    else
      render :new
    end
  end

  def edit
    
  end

  def update    
    if @user.update(params_user)
      redirect_to backoffice_user_path, notice:
      "Usuário atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @user.person.present?
      @user.person.adress.destroy  if @user.person.adress.present?
      @user.person.destroy
    end
    @user.destroy

    redirect_to "/backoffice/users", notice: "Usuário atualizado com sucesso!"
  end

  private
  def set_user
    @user = User.find(params[:id] || params[:user_id])
  end

  def verify_password
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].extract!(:password, :password_confirmation)
    end
  end

  def params_user
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end