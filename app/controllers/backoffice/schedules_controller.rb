class Backoffice::SchedulesController < BackofficeController
  skip_before_action :verify_authenticity_token
  before_action :set_schedule, only: %i[ show edit update destroy ]
  before_action :set_user

  def index
    @schedules = Schedule.all
  end

  def show
  end

  def new
    @schedule = Schedule.new
  end

  def edit
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.person_id = @person.id

    if @schedule.save  
      redirect_to "/backoffice/users/#{@user.id}"
    else
      render :create
    end
  end

  def update
    schedule = Schedule.find(params[:id])
    params_schedule = params.require(:schedule).permit(:day, :hour)
    
    if schedule.update(params_schedule)
      if @user == current_user
        redirect_to "/backoffice/users"
      else 
        redirect_to "/backoffice/users/#{@user.id}"
      end
      flash[:notice] = "Matrícula atualizada com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @schedule.destroy

    respond_to do |format|
      format.html { redirect_to backoffice_users_path, notice: "Schedule excluído com sucesso." }
      format.json { head :no_content }
    end
  end

  private
  def schedule_params
    params.require(:schedule).permit(:day, :hour)
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def set_user
    user_id = params[:user_id]
    @user = User.find(user_id)
    @person = @user.person
    @schedules = @person.schedules
  end
end
