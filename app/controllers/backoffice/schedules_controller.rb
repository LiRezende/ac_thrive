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
      if @user == current_user
        redirect_to backoffice_profile_path(current_user)
      else  
        redirect_to "/backoffice/users/#{@user.id}"
      end
      flash[:notice] = "Horário registrado com sucesso!"
    else
      render :create
    end
  end

  def update
    schedule = Schedule.find(params[:id])
    params_schedule = params.require(:schedule).permit(:day, :hour)
    
    if schedule.update(params_schedule)
      if @user == current_user
        redirect_to backoffice_profile_path(current_user)
      else 
        redirect_to "/backoffice/users/#{@user.id}"
      end
      flash[:notice] = "Horário atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @schedule.destroy

    if @user == current_user
      redirect_to backoffice_profile_path(current_user)
    else 
      redirect_to "/backoffice/users/#{@user.id}"
    end
    flash[:notice] = "Horário excluído com sucesso!"
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
