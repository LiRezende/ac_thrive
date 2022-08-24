class Backoffice::DashboardController < BackofficeController
  def index
    @users = User.all
  end

  def index
    @people = Person.all
  end
end
