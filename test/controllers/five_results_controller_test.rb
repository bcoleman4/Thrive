require 'test_helper'

class FiveResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @five_result = five_results(:one)
  end

  test "should get index" do
    get five_results_url
    assert_response :success
  end

  test "should get new" do
    get new_five_result_url
    assert_response :success
  end

  test "should create five_result" do
    assert_difference('FiveResult.count') do
      post five_results_url, params: { five_result: { R1: @five_result.R1, R2: @five_result.R2, R3: @five_result.R3, R4: @five_result.R4, R5: @five_result.R5 } }
    end

    assert_redirected_to five_result_url(FiveResult.last)
  end

  test "should show five_result" do
    get five_result_url(@five_result)
    assert_response :success
  end

  test "should get edit" do
    get edit_five_result_url(@five_result)
    assert_response :success
  end

  test "should update five_result" do
    patch five_result_url(@five_result), params: { five_result: { R1: @five_result.R1, R2: @five_result.R2, R3: @five_result.R3, R4: @five_result.R4, R5: @five_result.R5 } }
    assert_redirected_to five_result_url(@five_result)
  end

  test "should destroy five_result" do
    assert_difference('FiveResult.count', -1) do
      delete five_result_url(@five_result)
    end

    assert_redirected_to five_results_url
  end
end
