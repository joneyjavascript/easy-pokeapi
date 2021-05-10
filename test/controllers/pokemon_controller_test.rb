require "test_helper"

class PokemonControllerTest < ActionDispatch::IntegrationTest
  test "ditto pokemn has success" do
    get "/pokemon/abilities/ditto"
    assert_response :success
  end
end
