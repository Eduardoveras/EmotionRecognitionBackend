require 'test_helper'

class CriminalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @criminal = criminals(:one)
  end

  test "should get index" do
    get criminals_url, as: :json
    assert_response :success
  end

  test "should create criminal" do
    assert_difference('Criminal.count') do
      post criminals_url, params: { criminal: { name: @criminal.name } }, as: :json
    end

    assert_response 201
  end

  test "should show criminal" do
    get criminal_url(@criminal), as: :json
    assert_response :success
  end

  test "should update criminal" do
    patch criminal_url(@criminal), params: { criminal: { name: @criminal.name } }, as: :json
    assert_response 200
  end

  test "should destroy criminal" do
    assert_difference('Criminal.count', -1) do
      delete criminal_url(@criminal), as: :json
    end

    assert_response 204
  end
end
