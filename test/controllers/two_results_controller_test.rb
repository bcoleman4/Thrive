require 'test_helper'

class TwoResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @two_result = two_results(:one)
  end

  test "should get index" do
    get two_results_url
    assert_response :success
  end

  test "should get new" do
    get new_two_result_url
    assert_response :success
  end

  test "should create two_result" do
    assert_difference('TwoResult.count') do
      post two_results_url, params: { two_result: { R1: @two_result.R1, R2: @two_result.R2 } }
    end

    assert_redirected_to two_result_url(TwoResult.last)
  end

  test "should show two_result" do
    get two_result_url(@two_result)
    assert_response :success
  end

  test "should get edit" do
    get edit_two_result_url(@two_result)
    assert_response :success
  end

  test "should update two_result" do
    patch two_result_url(@two_result), params: { two_result: { R1: @two_result.R1, R2: @two_result.R2 } }
    assert_redirected_to two_result_url(@two_result)
  end

  test "should destroy two_result" do
    assert_difference('TwoResult.count', -1) do
      delete two_result_url(@two_result)
    end

    assert_redirected_to two_results_url
  end
end
