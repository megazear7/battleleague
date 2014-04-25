class ArmiesController < ApplicationController
  before_action :set_army, only: [:show, :edit, :update, :destroy]

  # GET /armies
  # GET /armies.json
  def index
    @armies = Army.all.where(user: current_user)
  end

  # GET /armies/1
  # GET /armies/1.json
  def show
  end

  # GET /armies/new
  def new
    @army = Army.new
  end

  # GET /armies/1/edit
  def edit
  end

  # POST /armies
  # POST /armies.json
  def create
    @army = Army.new(army_params)

    @army.user.games << @army.game

    respond_to do |format|
      if @army.save
        format.html { redirect_to @army, notice: 'Army was successfully created.' }
        format.json { render action: 'show', status: :created, location: @army }
      else
        format.html { render action: 'new' }
        format.json { render json: @army.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /armies/1
  # PATCH/PUT /armies/1.json
  def update
    respond_to do |format|
      if @army.update(army_params)
        format.html { redirect_to @army, notice: 'Army was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @army.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /armies/1
  # DELETE /armies/1.json
  def destroy
    @army.destroy
    respond_to do |format|
      format.html { redirect_to armies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_army
      @army = Army.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def army_params
      params.require(:army).permit(
        :name,
        :description,
        :army_type,
        :point_cost,
        :movement_rate,
        :x_cord,
        :y_cord,
        :game_id,
        :user_id
      )
    end
end
