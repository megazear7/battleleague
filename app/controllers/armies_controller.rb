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
    redirect_to @army.game, notice: 'That is not your army' if not current_user.armies.include? @army
  end

  # POST /armies
  # POST /armies.json
  def create
    @army = Army.new(army_params)

    @army.user.games << @army.game

    @army.turn_count = 0

    @army.game.armies.each do |army|
      army.turn_count += 1
    end

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

    if not @army.move_check(params[:army][:x_cord], params[:army][:y_cord])
      redirect_to edit_army_path(@army), notice: "This army can only move " + @army.movement_rate.to_s + " and is currently at (" + @army.x_cord.to_s + "," + @army.y_cord.to_s + ")"
      return
    elsif @army != @army.game.current_army
      redirect_to edit_army_path(@army), notice: "It is not this armies turn, it will be in " + (@army.game.current_army.turn_count - @army.turn_count).to_s + " turns"
      return
    end

    @army.turn_count = 0
    @army.save
    @army.game.armies.each do |army|
      army.turn_count += 1
      army.save
    end

    respond_to do |format|
      if @army.update(army_params)
        if @army.game
          format.html { redirect_to @army.game, notice: 'Army was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { redirect_to @army, notice: 'Army was successfully updated.' }
          format.json { head :no_content }
        end
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
