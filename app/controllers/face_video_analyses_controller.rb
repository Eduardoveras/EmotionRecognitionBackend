class FaceVideoAnalysesController < ApplicationController
  before_action :set_face_video_analysis, only: [:show, :update, :destroy]

  # GET /face_video_analyses
  def index
    @face_video_analyses = FaceVideoAnalysis.all

    render json: @face_video_analyses
  end

  # GET /face_video_analyses/1
  def show
    render json: @face_video_analysis
  end

  # POST /face_video_analyses
  def create
    @face_video_analysis = FaceVideoAnalysis.new(face_video_analysis_params)

    if @face_video_analysis.save
      render json: @face_video_analysis, status: :created, location: @face_video_analysis
    else
      render json: @face_video_analysis.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /face_video_analyses/1
  def update
    if @face_video_analysis.update(face_video_analysis_params)
      render json: @face_video_analysis
    else
      render json: @face_video_analysis.errors, status: :unprocessable_entity
    end
  end

  # DELETE /face_video_analyses/1
  def destroy
    @face_video_analysis.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_face_video_analysis
      @face_video_analysis = FaceVideoAnalysis.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def face_video_analysis_params
      params.require(:face_video_analysis).permit(:notes)
    end
end
