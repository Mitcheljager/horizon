class Api::KeysController < ApplicationController
  before_action :set_api_key, only: [:show, :update, :destroy]

  def index
    @api_keys = Api::Key.all
  end

  def show
  end

  def create
    @api_key = Api::Key.new(api_key_params)

    if @api_key.save
      render json: @api_key, status: :created, location: @api_key
    else
      render json: @api_key.errors, status: :unprocessable_entity
    end
  end

  def update
    if @api_key.update(api_key_params)
      render :show, status: :ok, location: @api_key
    else
      render json: @api_key.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @api_key.destroy!
  end

  private

  def set_api_key
    @api_key = Api::Key.find_by_identity!(params.expect(:identity))
  end

  def api_key_params
    params.expect(api_key: [:identity, :project_id])
  end
end
