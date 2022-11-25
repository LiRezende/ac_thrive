class Backoffice::TeachersController < BackofficeController
  before_action :set_teacher, only: %i[ show edit update destroy ]
  before_action :set_user

  def index
    @teachers = Teacher.all
  end

  def show
  end

  def new
    @teacher = Teacher.new
  end

  def edit
  end

  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.person_id = @person.id

    if @teacher.save
      if @user == current_user
        redirect_to backoffice_profile_path(current_user)
      else  
      redirect_to "/backoffice/users/#{@user.id}"
      end
      flash[:notice] = "Matrícula de professor cadastrada com sucesso!"
    else
      render :create
    end
  end

  def update
    teacher = Teacher.find(params[:id])
    params_teacher = params.require(:teacher).permit(:fee, :person_id, :idiom_id)
    
    if teacher.update(params_teacher)
      if @user == current_user
        redirect_to backoffice_profile_path(current_user)
      else 
        redirect_to "/backoffice/users/#{@user.id}"
      end
      flash[:notice] = "Matrícula de professor atualizada com sucesso!"
    else
      render :edit
    end
  end

  private
  def teacher_params
    params.require(:teacher).permit(:fee, :person_id, :idiom_id)
  end

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def set_user
    user_id = params[:user_id]
    @user = User.find(user_id)
    @person = @user.person
    @teacher = @person.teacher
  end
end
