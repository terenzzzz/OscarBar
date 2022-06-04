class TemperatesController < ApplicationController
  before_action :set_temperate, only: [:show, :edit, :update, :destroy]

  # GET /temperates
  def index
    @temperates = Temperate.all
  end

  # GET /temperates/1
  def show
  end

  # GET /temperates/new
  def new
    @temperate = Temperate.new
  end

  # GET /temperates/1/edit
  def edit
    if session[:transferent] == 'created'
      @temperate = Temperate.where(user_id: current_user.id).last
    end
  end

  # POST /temperates
  def create
    @temperate = Temperate.new(temperate_params)

    if @temperate.save
      redirect_to @temperate, notice: 'Temperate was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /temperates/1
  def update
    @temperate = Temperate.where(user_id: current_user.id).last
    if @temperate.update(temperate_params)
      redirect_to '/pages/check_out', notice: '截图上传成功'
    else
      render :edit
    end
  end


  # DELETE /temperates/1
  def destroy
    @temperate.destroy
    redirect_to temperates_url, notice: 'Temperate was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_temperate
      @temperate = Temperate.where(user_id: current_user.id).last
    end

    # Only allow a list of trusted parameters through.
    def temperate_params
      # params.fetch(:temperate, :temp_transferent)
      params.require(:temperate).permit(:temp_transferent)
    end

    
end
