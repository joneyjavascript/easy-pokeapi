class PokemonController < ApplicationController
  def index
    render json: {}
  end

  def abilities
    pokemon_name = params.permit(:name)[:name]
    response = get_pokemon_api("pokemon/#{ pokemon_name }")
    sorted_abilities = response.parsed_response["abilities"].sort { |a, b|  a['ability']['name'] <=> b['ability']['name'] }.map { |ability| ability['ability'] }

    output =  {}

    sorted_abilities.each do |ability|
      url = ability['url']
      ability_details = HTTParty.get(url)
      effect_entry_en = ability_details["effect_entries"].select { |effect|  effect["language"]["name"] == 'en' }
      output[ability["name"].to_sym] = effect_entry_en.first["effect"]
    end

    render json: output
  end

  private 

    def get_pokemon_api resource
      HTTParty.get("#{ base_url }/#{ resource }")
    end
    

    def base_url
      'https://pokeapi.co/api/v2/'
    end
end
