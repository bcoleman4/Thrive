require 'test_helper'

class TwoOutputsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @two_output = two_outputs(:one)
  end

  test "should get index" do
    get two_outputs_url
    assert_response :success
  end

  test "should get new" do
    get new_two_output_url
    assert_response :success
  end

  test "should create two_output" do
    assert_difference('TwoOutput.count') do
      post two_outputs_url, params: { two_output: { O1: @two_output.O1, O2: @two_output.O2 } }
    end

    assert_redirected_to two_output_url(TwoOutput.last)
  end

  test "should show two_output" do
    get two_output_url(@two_output)
    assert_response :success
  end

  test "should get edit" do
    get edit_two_output_url(@two_output)
    assert_response :success
  end

  test "should update two_output" do
    patch two_output_url(@two_output), params: { two_output: { O1: @two_output.O1, O2: @two_output.O2 } }
    assert_redirected_to two_output_url(@two_output)
  end

  test "should destroy two_output" do
    assert_difference('TwoOutput.count', -1) do
      delete two_output_url(@two_output)
    end

    assert_redirected_to two_outputs_url
  end
end
