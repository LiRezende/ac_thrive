class Backoffice::SearchController < BackofficeController
    def users

        @users = User.includes(:people).where("first_name LIKE ?", "%#{params[:term]}%")
        
    end
end
