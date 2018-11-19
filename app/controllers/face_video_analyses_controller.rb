class FaceVideoAnalysesController < ApplicationController
  before_action :set_face_video_analysis, only: [:show, :update, :destroy, :add_video, :get_video]

  # GET /face_video_analyses
  def index
    @face_video_analyses = FaceVideoAnalysis.where(enabled:true)

    render json: @face_video_analyses.to_json(include: :criminal)
  end

  # GET /face_video_analyses/1
  def show
    @face_video_analysis.set_summary_data
    @face_video_analysis.save!
    render json: @face_video_analysis.to_json(include: :criminal)
  end

  def show_emotions_percentage
    @face_video_analyses = FaceVideoAnalysis.where(enabled:true)
    render json: @face_video_analyses, :except =>  [:criminal_id, :enabled, :case_id, :notes,:video_base64,:created_at,:updated_at,:average_age,:average_gender,:notable_moments,:duration]
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
    Emotion.where(:video_id => @face_video_analysis.id).destroy_all
    @face_video_analysis.destroy
  end

  def add_video
    @face_video_analysis.video_base64 = params[:video_file]
    @face_video_analysis.save!
  end

  def get_video
    render json: @face_video_analysis.video_base64.html_safe
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_face_video_analysis
    @face_video_analysis = FaceVideoAnalysis.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def face_video_analysis_params
    params.require(:face_video_analysis).permit(:notes,:case_id,:criminal_id,:enabled)
  end
end
