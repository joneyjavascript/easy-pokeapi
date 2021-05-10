class PokemonController < ApplicationController
  def abilities
    pokemon_service = PokemonService.new
    request_params = params.permit(:name)
    pokemon_name = request_params[:name]

    pokemon_abilities = pokemon_service.abilities pokemon_name

    if pokemon_abilities
      render json: pokemon_abilities
    else
      render json: { message: "Pokemon #{ pokemon_name } not found" }, status: :not_found
    end
  end

  private

    def get_pokemon_api resource
      HTTParty.get("#{ base_url }/#{ resource }")
    end

    def base_url
      'https://pokeapi.co/api/v2/'
    end

end
