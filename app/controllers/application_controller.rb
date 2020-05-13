class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        # ajouter de nouveaux parametres a devise, tels que first_name, last_name, pour l'inscription (sign_up) et l'update (account_update) du compte
        devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :description)}
        devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :description)}
    end

end
