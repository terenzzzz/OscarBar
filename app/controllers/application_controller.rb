class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :destroy_cart, only: :destroy

    def after_sign_in_path_for(resource)
        if current_user.id == 1
            session[:role] = 'Admin'
            admins_path
        else
            session[:role] = 'User'
            buyers_path
        end
    end

    def destroy_cart
        if session[:role] == 'User'
            current_user.cart.destroy
        end
    end

    #strong params for sign up form
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :mobile, :wechat, :apartment ])
      end

end
