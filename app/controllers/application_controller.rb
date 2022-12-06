class ApplicationController < ActionController::Base
    include Pundit::Authorization

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    protect_from_forgery with: :exception
    before_action :configure_sanitized_params, if: :devise_controller?

    def configure_sanitized_params
        devise_parameter_sanitizer.permit(:sign_up) do |u|
            u.permit(:email, :password, :password_confirmation, :status_id, :role_id, person_attributes: [:first_name, :last_name, :phone_number, :country_code])
        end
    end

    def after_sign_in_path_for(resource)
        '/backoffice/home/index'
    end

    protected
    def user_not_authorized
        flash[:alert] = "Você não possui permissõ para realizar esta ação."
        redirect_back(fallback_location: '/backoffice/home/index')
    end
end