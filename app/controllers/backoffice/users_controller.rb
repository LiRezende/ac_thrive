class Backoffice::UsersController < BackofficeController
    def show
        @user = User.find(params[:user_id])
    end
end
