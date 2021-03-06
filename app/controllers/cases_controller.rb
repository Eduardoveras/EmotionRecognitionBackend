class CasesController < ApplicationController
  before_action :set_case, only: [:show, :update, :destroy]

  # GET /cases
  def index
    @cases = Case.where(enabled: true)

    render json: @cases
  end

  def links
    render json: Case.select(:link,:id)

  end

  # GET /cases/1
  def show
    #render json: @case.to_json(:include => :face_video_analysis)
    render json: @case.to_json(include: {face_video_analysis: {include: :criminal} })

  end

  # POST /cases
  def create
    @case = Case.new(case_params)

    if @case.save
      render json: @case, status: :created, location: @case
    else
      render json: @case.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cases/1
  def update
  if @case.update(case_params)
    render json: @case
  else
    render json: @case.errors, status: :unprocessable_entity
  end
end

  # DELETE /cases/1
  def destroy
    @case.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_case
      @case = Case.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def case_params
      params.require(:case).permit(:face_video_analysis_id, :notes,:enabled, :link)
    end
end
