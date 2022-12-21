class Backoffice::UsersController < BackofficeController
  before_action :authenticate_user!
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :verify_password, only: [:update]
  
  def index
    @users = policy_scope(User.all)
    @users = @users.joins("left join people on people.user_id = users.id")
    @users = @users.joins("left join schedules on schedules.person_id = people.id")
    @users = @users.order(first_name: :asc)

    if params[:term].present?
      @users = @users.where("lower(people.first_name) LIKE ?", "%#{params[:term].downcase}%")
    end

    if params[:day].present?
      @users = @users.where("schedules.day = ?", params[:day])
    end

    if params[:initial_hour].present?
      @users = @users.where("schedules.hour >= ?", params[:initial_hour].to_time.strftime("%H:%M"))
    end

    if params[:final_hour].present?
      @users = @users.where("schedules.hour <= ?", params[:final_hour].to_time.strftime("%H:%M"))
    end

    @users = @users.page(params[:page])
  end
    
  def show
    
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    
    @user = User.new(params_user)
    authorize @user
    if @user.save
      if @user.person.blank?
        @user.person = Person.new
      end
 
      @user.person.first_name = params[:user][:first_name]
      @user.person.last_name = params[:user][:last_name]
      @user.person.country_code = params[:user][:country_code]
      @user.person.phone_number = params[:user][:phone_number]

      @user.person.save

      save_role

      redirect_to backoffice_users_path, notice:
      "Usuário cadastrado com sucesso!"
    else
      render :new
    end
  end

  def edit
    authorize @user
  end

  def update 
    authorize @user
    if @user.update(params_user)
      save_role
      if @user == current_user
        redirect_to backoffice_profile_path(current_user)
      else
        redirect_to "/backoffice/users/#{@user.id}"
      end
      flash[:notice] = "Usuário atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @user.person.present?
      @user.person.adress.destroy if @user.person.adress.present?
      @user.person.destroy
    end
    @user.destroy

    redirect_to "/backoffice/users", notice: "Usuário excluído com sucesso!"
  end

  private
  def save_role
    if params[:user][:role_ids].present?
      @user.roles.destroy_all
      params[:user][:role_ids].compact.select{|element| element.present?}.each do |role_id|
        @user.roles << Role.find(role_id)
      end
    end
  end

  def set_user
    @user = User.find(params[:id] || params[:user_id])
    authorize @user
  end

  def verify_password
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].extract!(:password, :password_confirmation)
    end
  end

  def params_user
    params.require(:user).permit(:email, :password, :password_confirmation, :status_id, person_attributes: [:first_name, :last_name, :phone_number, :country_code])
  end
end