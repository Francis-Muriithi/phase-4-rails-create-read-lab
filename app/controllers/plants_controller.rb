class PlantsController < ApplicationController
    wrap_parameters format: []
    def index
        plants = Plant.all
        render json: plants
    end
    def show
        plant = Plant.find_by(id: params[:id])
        if plant
          render json: plant
        else
          render json: { error: "The plant does not exist" }, status: :not_found
        end
      end

    # POST /birds
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  # other controller actions here

  private
  # all methods below here are private

  def plant_params
    params.permit(:name, :image, :price)
  end

end
