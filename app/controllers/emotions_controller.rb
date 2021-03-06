class EmotionsController < ApplicationController
  before_action :set_emotion, only: [:show, :update, :destroy]

  # GET /emotions
  def index
    @emotions = Emotion.all

    render json: @emotions
  end

  # GET /emotions/1
  def show
    render json: @emotion
  end

  # POST /emotions
  def create
    @emotion = Emotion.new(emotion_params)

    if @emotion.save
      render json: @emotion, status: :created, location: @emotion
    else
      render json: @emotion.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /emotions/1
  def update
    if @emotion.update(emotion_params)
      render json: @emotion
    else
      render json: @emotion.errors, status: :unprocessable_entity
    end
  end

  # DELETE /emotions/1
  def destroy
    @emotion.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_emotion
    @emotion = Emotion.where(video_id: params[:id])
  end

    # Only allow a trusted parameter "white list" through.
    def emotion_params
      params.require(:emotion).permit(:timeStamp, :facesCount, :appearance, :emotions, :expressions,:video_id,:measurements, :featurePoints)
    end
end
