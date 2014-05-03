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
    #@games = current_user.games
    # HACK WARNING!!!
    #@games.each do |game|
    #  @games = @games - [game] if @games.include? game
    #  @games << game
    #end
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @comment = Comment.new
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

    old_map = Map.find(params[:game][:map_id]) 
    @game.map = old_map.dup
    old_map.spaces.each do |old_space|
      new_space = old_space.dup
      @game.map.spaces << new_space
    end
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
    @game.battling_armies.each do |army|
      army.is_loser = true if army.is_winner == false
      army.save
    end
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

  def resolve_battle
    @game = Game.find(params[:game_id])
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
        :game_master_id,
        armies_attributes: [
          :id,
          :is_winner,
          :is_loser
        ]
      )
    end
end
