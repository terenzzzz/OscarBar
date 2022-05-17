class ProfilesController < ApplicationController
  def index
  end

  def show
  end

  def edit
    @user = User.find(current_user.id)
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
        @user = User.find(current_user.id)
    end
end
