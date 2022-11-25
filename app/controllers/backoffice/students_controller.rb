class Backoffice::StudentsController < BackofficeController
  before_action :set_student, only: %i[ show edit update destroy ]
  before_action :set_user

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    @student.person_id = @person.id

    if @student.save
      if @user == current_user
        redirect_to backoffice_profile_path(current_user)
      else
        redirect_to "/backoffice/users/#{@user.id}"
      end
      flash[:notice] = "Matrícula de estudante cadastrada com sucesso!"  
    else
      render :create
    end
  end

  def update
    student = Student.find(params[:id])
    params_student = params.require(:student).permit(:occupation, :position, :financial_responsible, :person_id, :idiom_id, :idiom_level_id, :teacher_id, :company_id)
    
    if student.update(params_student)
      if @user == current_user
        redirect_to backoffice_profile_path(current_user)
      else 
        redirect_to "/backoffice/users/#{@user.id}"
      end
      flash[:notice] = "Matrícula de estudante atualizada com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:occupation, :position, :financial_responsible, :person_id, :idiom_id, :idiom_level_id, :teacher_id, :company_id)
    end

    def set_user
      user_id = params[:user_id]
      @user = User.find(user_id)
      @person = @user.person
      @student = @person.student
    end
end
