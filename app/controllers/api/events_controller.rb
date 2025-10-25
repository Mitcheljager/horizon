class Api::EventsController < ApplicationController
  before_action :set_api_event, only: [:show, :update, :destroy]

  def index
    @api_events = Api::Event.all
  end

  def show
  end

  def create
    @api_event = Api::Event.new(api_event_params)

    if @api_event.save
      render :show, status: :created, location: @api_event
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
