class GymsController < ApplicationController
  
  def index
    gyms = Gym.all
    render json: gyms, status: :ok
  end

  def show
    gym = Gym.find(params[:id])
    render json: gym, status: :ok
  end

  def update
    gym = Gym.find(params[:id])
    gym.update!(gym_params)
    render json: gym, status: :ok
  end

  def destroy
    gym = Gym.find(params[:id])
    gym.destroy
    head :no_content
  rescue ActiveRecord::RecordNotFound
    render json: {error: "Gym not found"}
  end

  private

  def gym_params
    params.permit(:name, :address)
  end

end
