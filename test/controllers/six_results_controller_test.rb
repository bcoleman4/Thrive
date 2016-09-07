require 'test_helper'

class SixResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @six_result = six_results(:one)
  end

  test "should get index" do
    get six_results_url
    assert_response :success
  end

  test "should get new" do
    get new_six_result_url
    assert_response :success
  end

  test "should create six_result" do
    assert_difference('SixResult.count') do
      post six_results_url, params: { six_result: { R1: @six_result.R1, R2: @six_result.R2, R3: @six_result.R3, R4: @six_result.R4, R5: @six_result.R5, R6: @six_result.R6 } }
    end

    assert_redirected_to six_result_url(SixResult.last)
  end

  test "should show six_result" do
    get six_result_url(@six_result)
    assert_response :success
  end

  test "should get edit" do
    get edit_six_result_url(@six_result)
    assert_response :success
  end

  test "should update six_result" do
    patch six_result_url(@six_result), params: { six_result: { R1: @six_result.R1, R2: @six_result.R2, R3: @six_result.R3, R4: @six_result.R4, R5: @six_result.R5, R6: @six_result.R6 } }
    assert_redirected_to six_result_url(@six_result)
  end

  test "should destroy six_result" do
    assert_difference('SixResult.count', -1) do
      delete six_result_url(@six_result)
    end

    assert_redirected_to six_results_url
  end
end
