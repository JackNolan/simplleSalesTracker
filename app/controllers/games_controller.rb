class GamesController < ApplicationController
  def index
    @games = Game.all.collect(&:name)
    respond_to do |format|
      format.json {render json: @games}
    end
  end

  def show

    if params[:selected_id]
      @game = Game.find_by_id(params[:selected_id])
      render :json => @game.to_json

      # timeline = Timeline.new
      # timeline.get_next_day(params[:published_at])
      # timeline.group_by_date
      # @grouped_events = timeline.events
      # @json = render_to_string :partial => "event", :locals => {:grouped_events => @grouped_events}
      # render :json => @json.to_json      
    else
      render :json => 'empty'
    end

  end
end
