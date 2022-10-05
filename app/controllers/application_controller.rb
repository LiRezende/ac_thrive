class ApplicationController < ActionController::Base
    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    protect_from_forgery with: :exception
    before_action :configure_sanitized_params, if: :devise_controller?

    def configure_sanitized_params
        devise_parameter_sanitizer.permit(:sign_up) do |u|
            u.permit(:email, :password, :password_confirmation, :status_id, person_attributes: [:first_name, :last_name, :phone_number])
        end
    end

    protected

    def user_not_authorized(exception)
        policy_name = exception.policy.class.to_s.underscore
    
        flash[:alert] = t "#{policy_name}.#{exception.query}", scope: 'pundit', default: :default
        redirect_to(request.referrer || root_path)
    end
end
