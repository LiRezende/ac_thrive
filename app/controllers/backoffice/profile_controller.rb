class Backoffice::ProfileController < BackofficeController
    before_action :set_user, only: %i[ show edit update destroy ]
    before_action :verify_password, only: [:update]

    def index
        
    end

    def edit
        
    end

    def show
         
    end

    def update
      if @profile.update(params_user)
        redirect_to backoffice_user_path, notice:
        "Usuário atualizado com sucesso!"
      else
        render :edit
      end   
    end

  private
  def set_user
    @profile = current_user
  end

  def verify_password
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].extract!(:password, :password_confirmation)
    end
  end

  def params_user
    params.require(:user).permit(:email, :password, :password_confirmation, :status_id, :role_id)
  end
end