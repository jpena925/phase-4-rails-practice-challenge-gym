class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
        gyms = Gym.all
        render json: gyms
    end
    
    def show
        gym = Gym.find(params[:id])
        render json: gym
    end

    def create
        gym = Gym.create!(gym_params)
        render json: gym
    end

    def destroy
        gym = Gym.find(params[:id])
        gym.destroy
        render json: {}, status: :no_content
    end
    
    private 

    def record_not_found
        render json: {error: "Gym not found"}, status: :not_found
    end

    def gym_params
        params.permit(:name, :address)
    end
end
