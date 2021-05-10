class PokemonService
  BASE_URL = Rails.application.config.pokemon_api_base_url

  def abilities pokemon_name
    pokemon_abilities = abilities_raw pokemon_name
    return nil unless pokemon_abilities

    relevant_abilities_data = pokemon_abilities.map { |ability| ({ "name" => ability['ability']['name'], "url" => ability['ability']['url'] }) } # extract only ability data
    sorted_abilities = relevant_abilities_data.sort { |a, b|  a['name'] <=> b['name']} # sort ability by name

    abilities_effect =  {}
    sorted_abilities.each do |ability|
      ability_details = HTTParty.get(ability['url'])
      effect_entries = ability_details["effect_entries"]
      effect_entry_en = effect_entries.select { |effect| effect["language"]["name"] == 'en' }
      abilities_effect[ability["name"].to_sym] = effect_entry_en.first["effect"]
    end

    abilities_effect
  end

  private

    def abilities_raw pokemon_name
      response = get_request("pokemon/#{ pokemon_name }")
      response.parsed_response["abilities"]
    end

    def get_request resource
      HTTParty.get("#{ BASE_URL }/#{ resource }")
    end

end