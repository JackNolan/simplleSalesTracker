class WatchersController < ApplicationController
  # GET /watchers
  # GET /watchers.json
  def index
    @watchers = Watcher.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @watchers }
    end
  end

  # GET /watchers/1
  # GET /watchers/1.json
  def show
    @watcher = Watcher.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @watcher }
    end
  end

  # GET /watchers/new
  # GET /watchers/new.json
  def new
    @watcher = Watcher.new
    @game_names = '"asdfasdf"'
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @watcher }
    end
  end

  # GET /watchers/1/edit
  def edit
    @watcher = Watcher.find(params[:id])
  end

  # POST /watchers
  # POST /watchers.json
  def create
    @watcher = Watcher.new(params[:watcher])

    respond_to do |format|
      if @watcher.save
        format.html { redirect_to root_path, notice: "You will be notified if #{@watcher.game.name}'s price is equal to or less then $#{@watcher.price.to_s}" }
        format.json { render json: @watcher, status: :created, location: @watcher }
      else
        format.html { render action: "new" }
        format.json { render json: @watcher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /watchers/1
  # PUT /watchers/1.json
  def update
    @watcher = Watcher.find(params[:id])

    respond_to do |format|
      if @watcher.update_attributes(params[:watcher])
        format.html { redirect_to @watcher, notice: 'Watcher was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @watcher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /watchers/1
  # DELETE /watchers/1.json
  def destroy
    @watcher = Watcher.find(params[:id])
    @watcher.destroy

    respond_to do |format|
      format.html { redirect_to watchers_url }
      format.json { head :no_content }
    end
  end
end
