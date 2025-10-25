class Api::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  before_action :set_api_event, only: [:show, :update, :destroy]

  def index
    @api_events = Api::Event.all
  end

  def show
  end

  def create
    authorization_header = request.headers["Authorization"]&.split(" ")&.last

    @api_key = Api::Key.find_by_identity!(authorization_header)
    @api_event = Api::Event.new({
      name: params[:name],
      properties: params[:properties],
      api_key: @api_key
    })

    if @api_event.save
      head :ok
    else
      render json: @api_event.errors, status: :unprocessable_entity
    end
  end

  def update
    if @api_event.update(api_event_params)
      render :show, status: :ok, location: @api_event
    else
      render json: @api_event.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @api_event.destroy!
  end

  private

  def set_api_event
    @api_event = Api::Event.find(params.expect(:id))
  end

  def api_event_params
    params.expect(api_event: [:name, :properties, :project_id])
  end
end
