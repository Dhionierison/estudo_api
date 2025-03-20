require "test_helper"

class VendasControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get vendas_create_url
    assert_response :success
  end
end
