require 'test_helper'

class FourResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @four_result = four_results(:one)
  end

  test "should get index" do
    get four_results_url
    assert_response :success
  end

  test "should get new" do
    get new_four_result_url
    assert_response :success
  end

  test "should create four_result" do
    assert_difference('FourResult.count') do
      post four_results_url, params: { four_result: { R1: @four_result.R1, R2: @four_result.R2, R3: @four_result.R3, R4: @four_result.R4 } }
    end

    assert_redirected_to four_result_url(FourResult.last)
  end

  test "should show four_result" do
    get four_result_url(@four_result)
    assert_response :success
  end

  test "should get edit" do
    get edit_four_result_url(@four_result)
    assert_response :success
  end

  test "should update four_result" do
    patch four_result_url(@four_result), params: { four_result: { R1: @four_result.R1, R2: @four_result.R2, R3: @four_result.R3, R4: @four_result.R4 } }
    assert_redirected_to four_result_url(@four_result)
  end

  test "should destroy four_result" do
    assert_difference('FourResult.count', -1) do
      delete four_result_url(@four_result)
    end

    assert_redirected_to four_results_url
  end
end
