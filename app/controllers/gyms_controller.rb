class GymsController < ApplicationController
  
  def index
    gyms = Gym.all
    render json: gyms
  end

  def show
    gym = Gym.find_by_id(params[:id])
    if gym
    render json: gym
    else 
      render json: { error: "Gym not found" }, status: :not_found
    end 
  end

  def update
    gym = Gym.find_by_id(params[:id])
    if gym
      gym.update(gym_params)
    render json: gym
    else 
      render json: { error: "Gym not found" }, status: :not_found
    end 
  end

  def destroy
    gym = Gym.find_by_id(params[:id])
    if gym
      gym.destroy
      render json: {}
    else
      render json: { error: "Gym not found" }, status: 404
    end
  end

  private
  def gym_params
    params.permit(:name, :address)
  end

end
