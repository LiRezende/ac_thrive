class Backoffice::SchedulesController < BackofficeController
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
    params_schedule = params.require(:schedule).permit(:day, :hour, :person_id)
    
    if schedule.update(params_teacher)
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

  private
  def schedule_params
    params.require(:schedule).permit(:day, :hour, :person_id)
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def set_user
    user_id = params[:user_id]
    @user = User.find(user_id)
    @person = @user.person
    @schedule = @person.schedules
  end
end
