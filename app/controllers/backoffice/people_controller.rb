class Backoffice::PeopleController < BackofficeController
  before_action :set_person, only: %i[ show edit update destroy ]
  before_action :set_user

  def index
    @people = Person.all
  end

  def show
  end

  def new
    @person = Person.new
  end

  def edit
    if !current_user.has_role?(:Administrador) && @person.id != current_user.person.id
      flash[:error] = 'Você não tem permissão para fazer esta ação.'
      redirect_to "/backoffice/home/index"
    end
  end

  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to person_url(@person), notice: "Person was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    person = Person.find(params[:id])
    params_person = params.require(:person).permit(:first_name, :last_name, :phone_number, :birthdate, :country_code)
    
    if person.update(params_person)
      if @user == current_user
        redirect_to backoffice_profile_path
      else 
        redirect_to "/backoffice/users/#{@user.id}"
      end
      flash[:notice] = "Endereço atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url, notice: "Person was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_person
      @person = Person.find(params[:id])
    end

    def set_user
      user_id = params[:user_id]
      @user = User.find(user_id)
    end

    def person_params
      params.require(:person).permit(:first_name, :last_name, :phone_number, :birthdate, :country_code)
    end
end