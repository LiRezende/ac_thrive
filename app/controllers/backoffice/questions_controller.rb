class Backoffice::QuestionsController < BackofficeController
  before_action :set_question, only: %i[ show edit update destroy ]
  before_action :set_user

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    @question.person_id = @person.id

    if @question.save
      if @user == current_user
        redirect_to backoffice_profile_path(current_user)
      else
        redirect_to "/backoffice/users/#{@user.id}"
      end
      flash[:notice] = "Questões do perfil do aluno preenchidas com sucesso!"  
    else
      render :create
    end
  end

  def update
    question = Question.find(params[:id])
    params_question = params.require(:question).permit(:motivation, :hobby, :country, :culture, :work, :person_id)
    
    if question.update(params_question)
      if @user == current_user
        redirect_to backoffice_profile_path(current_user)
      else 
        redirect_to "/backoffice/users/#{@user.id}"
      end
      flash[:notice] = "Questões do perfil do aluno atualizadas com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url, notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:motivation, :hobby, :country, :culture, :work, :person_id)
    end

    def set_user
      user_id = params[:user_id]
      @user = User.find(user_id)
      @person = @user.person
      @question = @person.question
    end
end
