class Backoffice::ProfileController < BackofficeController
    def index
        @user = current_user
    end

    def edit
        @user = current_user
    end

    def update
        @user = current_user
        
        password_confirmation = params[:user][:password_confirmation]
        current_password = params[:user][:current_password]
        
        if @user.email != params[:user][:email] 
            flash[:alert] = "email não reconhecido"
            return redirect_to "/profile/edit"            
        end
        if password_confirmation != params[:user][:password] 
            flash[:alert] = "email não bate com a confirmação"
            return redirect_to "/profile/edit"            
        end
        @user.password = params[:user][:password] 

        @user.save 
        return redirect_to "/profile"     
        
    end
end