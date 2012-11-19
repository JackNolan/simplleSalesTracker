class GamesController < ApplicationController
  autocomplete :game, :name
  def index
    @games = Game.all.collect(&:name)
    respond_to do |format|
      format.json {render json: @games}
    end
  end
end