class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def set_turns
    @game = Game.find(params[:game_id])
    if current_user != @game.game_master
      redirect_to @game, notice: "Only the game master can do that!"
      return
    end
    @game.armies.each_with_index do |army, i|
      army.turn_count = i + 1
      army.save
    end
    redirect_to @game
  end

  # GET /games
  # GET /games.json
  def index
    if not current_user
      redirect_to new_user_session_path 
      return
    end
    @games = current_user.games
    current_user.games_as_master.each do |game|
      @games << game if not @games.include? game
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    @game.save

    map = Map.find(params[:game][:map_id]) 
    @game.map = map.dup
    @game.map.save
    @game.map.spaces.create({x_cord: map.width, y_cord: map.height, terrain: "Terrain Unknown"})
    @game.map.save

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render action: 'show', status: :created, location: @game }
      else
        format.html { render action: 'new' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(
        :name,
        :rule_set,
        :description,
        :objective,
        :details,
        :game_master_id
      )
    end
end
