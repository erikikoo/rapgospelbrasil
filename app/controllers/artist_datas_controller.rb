class ArtistDatasController < ApplicationController
  before_action :set_artist_data, only: [:show,:edit, :update, :destroy, :videos, :discography, :contact, :history, :agenda, :rede_social]
  before_action :authenticate_artist!, only: [:new ,:edit, :update, :destroy]
  # GET /artist_datas
  # GET /artist_datas.json
  def index
    @artist_datas = ArtistData.all
  end

  # GET /artist_datas/1
  # GET /artist_datas/1.json
  def show
    @teste = Commitment.where("artist_data_id = ?", params[:id]).limit(2)
  end

  # GET /artist_datas/new
  def new
    @artist_data = ArtistData.new
    
    @artist_data.phones.build
    @artist_data.emails.build
    @artist_data.build_history
  end

  # GET /artist_datas/1/edit
  def edit
  end

  # POST /artist_datas
  # POST /artist_datas.json
  def create
    @artist_data = ArtistData.new(artist_data_params)
    @artist_data.artist_id = current_artist.id

    respond_to do |format|
      if @artist_data.save
        format.html { redirect_to principal_index_path(current_artist.id), notice: 'Artist data was successfully created.' }
        format.json { render :show, status: :created, location: @artist_data }
      else
        format.html { render :new }
        format.json { render json: @artist_data.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artist_datas/1
  # PATCH/PUT /artist_datas/1.json
  def update
    respond_to do |format|
      if @artist_data.id == current_artist.id
        if @artist_data.update(artist_data_params)
          format.html { render principal_index_path, notice: 'Artist data was successfully updated.' }
          format.json { render :show, status: :ok, location: @artist_data }
        else
          format.html { render :edit }
          format.json { render json: @artist_data.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /artist_datas/1
  # DELETE /artist_datas/1.json
  def destroy
    
      @artist_data.destroy
      respond_to do |format|
        format.html { redirect_to artist_datas_url, notice: 'Artist data was successfully destroyed.' }
        format.json { head :no_content }
      end

  end

  def discography
    @discography = Discography.new 
    @profile = params[:profile]   
  end

  def contact
  end 

  def history
  end 

  def videos
  end

  def rede_social
  end

  def agenda
     @profile = params[:profile]   
  end  

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_artist_data
      @artist_data = ArtistData.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_data_params
      params.require(:artist_data).permit(:nome, :historia, :logo ,:emails_attributes => [:email], :phones_attributes => [:telefone], :history_attributes => [:historia])
    end
end
