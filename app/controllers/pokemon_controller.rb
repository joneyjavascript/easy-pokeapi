class PokemonController < ApplicationController
  def abilities
    request_params = params.permit(:name)
    pokemon_name = request_params[:name]

    pokemon_abilities = PokemonService.abilities pokemon_name

    if pokemon_abilities
      render json: pokemon_abilities
    else
      render json: { message: "Pokemon #{ pokemon_name } not found" }, status: :not_found
    end
  end
end
