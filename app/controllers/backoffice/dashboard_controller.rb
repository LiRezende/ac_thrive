class Backoffice::DashboardController < BackofficeController
    def index
        @users = User.includes(:person)

        @user_role = User.includes(:role)
    end
end
