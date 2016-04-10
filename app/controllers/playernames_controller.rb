class PlayernamesController < ApplicationController
  before_action :set_playername, only: [:show, :edit, :update, :destroy]

  # GET /playernames
  # GET /playernames.json
  def index
    reset_session
    @playernames = Playername.all
    session[:leagueid_callback] ||= params[:league_id]
    session[:seasonid_callback] ||= params[:season_id]
  end

  # GET /playernames/1
  # GET /playernames/1.json
  def show
  end

  # GET /playernames/new
  def new
    @playername = Playername.new
  end

  # GET /playernames/1/edit
  def edit
  end

  # POST /playernames
  # POST /playernames.json
  def create
    @playername = Playername.new(playername_params)

    respond_to do |format|
      if @playername.save
        format.html { redirect_to @playername, notice: 'Playername was successfully created.' }
        format.json { render :show, status: :created, location: @playername }
      else
        format.html { render :new }
        format.json { render json: @playername.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /playernames/1
  # PATCH/PUT /playernames/1.json
  def update
    respond_to do |format|
      if @playername.update(playername_params)
        format.html { redirect_to @playername, notice: 'Playername was successfully updated.' }
        format.json { render :show, status: :ok, location: @playername }
      else
        format.html { render :edit }
        format.json { render json: @playername.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playernames/1
  # DELETE /playernames/1.json
  def destroy
    @playername.destroy
    respond_to do |format|
      format.html { redirect_to playernames_url, notice: 'Playername was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playername
      @playername = Playername.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def playername_params
      params.require(:playername).permit(:name, :team, :amplua, :photolink)
    end
end
