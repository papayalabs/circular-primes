require 'test_helper'

class CircularPrimesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get circular_primes_index_url
    assert_response :success
  end

end
