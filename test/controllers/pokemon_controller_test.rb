require "test_helper"

class PokemonControllerTest < ActionDispatch::IntegrationTest
  test "ditto pokemon get abilities with effects" do
    get "/pokemon/abilities/ditto"
    body = response.parsed_body

    assert_response :success
    assert_equal body.count, 2
    assert_equal body.keys[0], 'imposter'
    assert_equal body.keys[1], 'limber'
  end

  test "invalid pokemon name returns not_found status code" do
    get "/pokemon/abilities/non_existent_pokemon"
    body = response.parsed_body

    assert_response :not_found
    assert body["message"].downcase.include?('not found')
  end
end
