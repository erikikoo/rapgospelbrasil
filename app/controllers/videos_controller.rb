class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :get_artist_current
  

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
  end

  # GET /videos/1
  # GET /videos/1.json
  def show

  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)
    @admin = params[:user]
    #@video.link = add_video(@video.link)
    if @admin == 'admin'
      @video.artist_id = current_artist.id
    else 
      @video.artist_data_id = @artist_data.id
    end  
    respond_to do |format|
      if @video.save        
        if @admin == 'admin' 
          @videos = Video.where('artist_id = ? OR artist_id = ?', 1, 2)            
          format.js {render :show_adm, location: @admin }
        else
          @videos = Video.where(artist_data_id: current_artist.id)            
          @admin = 'adm'
          format.js {render :show_art, location: @admin}
        end
      else
        format.js { render :new }
        
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
        @admin = params[:user]

      if @video.update(video_params)
        format.html { redirect_to "/show_video/#{@artist_data.id}/adm/atualizar"}
        format.json { render :show, status: :ok, location: @video }
      else
        format.js { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    @admin = params[:user]
    respond_to do |format|
        if @admin == 'admin'   
          format.js {render :show_adm, location: @admin }
        else
          @admin = "adm"
          format.html { redirect_to "/show_video/#{@artist_data.id}/adm/remover", notice: 'Video was successfully destroyed.' }
        end

      format.json { head :no_content }
    end
  end

  private
     def get_artist_current
      @artist_data = ArtistData.find_by('artist_id = ?', current_artist.id)
      end

    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:link, :profile)
    end


    def add_video(video)   
     "<iframe width='560' height='315' src='#{video}' frameborder='0' allowfullscreen></iframe>"
    end




end
