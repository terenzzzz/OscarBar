class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        if current_user.id = 1
            admins_path
        else
            buyers_path
        end
    end

end
