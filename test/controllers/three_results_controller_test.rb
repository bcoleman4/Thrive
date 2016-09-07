require 'test_helper'

class ThreeResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @three_result = three_results(:one)
  end

  test "should get index" do
    get three_results_url
    assert_response :success
  end

  test "should get new" do
    get new_three_result_url
    assert_response :success
  end

  test "should create three_result" do
    assert_difference('ThreeResult.count') do
      post three_results_url, params: { three_result: { R1: @three_result.R1, R2: @three_result.R2, R3: @three_result.R3 } }
    end

    assert_redirected_to three_result_url(ThreeResult.last)
  end

  test "should show three_result" do
    get three_result_url(@three_result)
    assert_response :success
  end

  test "should get edit" do
    get edit_three_result_url(@three_result)
    assert_response :success
  end

  test "should update three_result" do
    patch three_result_url(@three_result), params: { three_result: { R1: @three_result.R1, R2: @three_result.R2, R3: @three_result.R3 } }
    assert_redirected_to three_result_url(@three_result)
  end

  test "should destroy three_result" do
    assert_difference('ThreeResult.count', -1) do
      delete three_result_url(@three_result)
    end

    assert_redirected_to three_results_url
  end
end
