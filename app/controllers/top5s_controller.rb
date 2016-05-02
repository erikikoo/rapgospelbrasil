class Top5sController < ApplicationController
  before_action :set_top5, only: [:show, :edit, :update, :destroy]

  # GET /top5s
  # GET /top5s.json
  def index
    @top5s = Top5.order(created_at: :desc)    
  end

  # GET /top5s/1
  # GET /top5s/1.json
  def show
  end

  # GET /top5s/new
  def new
    @top5 = Top5.new
  end

  # GET /top5s/1/edit
  def edit
  end

  # POST /top5s
  # POST /top5s.json
  def create
    @top5 = Top5.new(top5_params)
    
    respond_to do |format|
      if @top5.save
        format.js 
      else
        format.html { render :new }
        format.json { render json: @top5.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /top5s/1
  # PATCH/PUT /top5s/1.json
  def update
    respond_to do |format|
      if @top5.update(top5_params)
        format.js { render :create}
        format.json { render :show, status: :ok, location: @top5 }
      else
        format.html { render :edit }
        format.json { render json: @top5.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /top5s/1
  # DELETE /top5s/1.json
  def destroy
    @top5.destroy
    respond_to do |format|
      format.html { redirect_to top5s_url, notice: 'Top5 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_top5
      @top5 = Top5.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def top5_params
      params.require(:top5).permit(:artist_id, :titulo, :artista, :titulo2, :artista2,:titulo3, :artista3,:titulo4, :artista4,:titulo5, :artista5)
    end
end
