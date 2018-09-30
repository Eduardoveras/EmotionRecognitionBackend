class CriminalsController < ApplicationController
  before_action :set_criminal, only: [:show, :update, :destroy]

  # GET /criminals
  def index
    @criminals = Criminal.all

    render json: @criminals
  end

  # GET /criminals/1
  def show
    render json: @criminal
  end

  # POST /criminals
  def create
    @criminal = Criminal.new(criminal_params)

    if @criminal.save
      render json: @criminal, status: :created, location: @criminal
    else
      render json: @criminal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /criminals/1
  def update
    if @criminal.update(criminal_params)
      render json: @criminal
    else
      render json: @criminal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /criminals/1
  def destroy
    @criminal.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_criminal
      @criminal = Criminal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def criminal_params
      params.require(:criminal).permit(:name)
    end
end
