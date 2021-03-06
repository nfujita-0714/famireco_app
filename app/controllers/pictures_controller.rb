class PicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_picture, only: %i[ show edit update destroy ]
  before_action :set_q, only: [:index, :search]

  # GET /pictures or /pictures.json
  def index
    @pictures = Picture.all.page(params[:page])
    # @pictures = @pictures.joins(:labels).where(labels: { id: params[:label_id] }) if params[:label_id].present?
  end

  # GET /pictures/1 or /pictures/1.json
  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  # GET /pictures/new
  def new
    @picture = Picture.new
  end

  # GET /pictures/1/edit
  def edit
    if current_user.id != @picture.user.id
      redirect_to pictures_path, alert: '他人の投稿は編集できません'
    end
  end

  # POST /pictures or /pictures.json
  def create
    @picture = current_user.pictures.build(picture_params) 
    if @picture.save
      redirect_to pictures_path, notice: '画像投稿しました'
    else
      flash.now[:error] = '投稿に失敗しました'
      render :new
    end
  end

  # PATCH/PUT /pictures/1 or /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: "投稿を編集しました" }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1 or /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: "投稿を削除しました" }
      format.json { head :no_content }
    end
  end

  def search
    @results = @q.result(distinct: true) #distinct=>結果の重複を防ぐ
  end
  
  private
  def set_q
    @q = Picture.ransack(params[:q])
  end

    # Use callbacks to share common setup or constraints between actions.
  def set_picture
    @picture = Picture.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def picture_params
    params.require(:picture).permit(:image, :content, :image_cache, :user_id, label_ids: [])
  end
end
