class Backoffice::DashboardController < BackofficeController
    def index
        @users = User.all

        @user_role = User.includes(:role)
    end
end
