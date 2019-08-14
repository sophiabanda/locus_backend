class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :update, :destroy]

  # GET /meetings
  def index
    @meetings = Meeting.all
    @response = HTTParty.get("https://api.yelp.com/v3/businesses/search?latitude=26.224963&longitude=-80.123168&limit=10", headers: {"Content-Type" => "application/json", "Authorization" => "Bearer GXHILCW8iiPEDUbfYwUXO2J5-CLmd4LHj0jjNYJPg-8eUTtISLw8eXedGhzH_6eFj7cy8sfYAH-5QvT8r6zF9JVybTsiFOq7FiDCzUwVAqRSOuvL9KfAIlAfAaRMXXYx"})
    render json: @response
  end

  # GET /meetings/1
  def show
    render json: @meeting
  end

  # POST /meetings
  def create
    @meeting = Meeting.new(meeting_params)

    if @meeting.save
      render json: @meeting, status: :created, location: @meeting
    else
      render json: @meeting.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /meetings/1
  def update
    if @meeting.update(meeting_params)
      render json: @meeting
    else
      render json: @meeting.errors, status: :unprocessable_entity
    end
  end


  # DELETE /meetings/1
  # def destroy
  #   @meeting.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def meeting_params
      params.require(:meeting).permit(:user_id, :coordinate_id)
    end
end
