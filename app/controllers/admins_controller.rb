class AdminsController < ApplicationController
    before_action :authenticate_user!
    def index
    end

    def view_user
        @users = User.all 
    end

end