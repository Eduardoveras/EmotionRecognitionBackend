require 'test_helper'

class EmotionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @emotion = emotions(:one)
  end

  test "should get index" do
    get emotions_url, as: :json
    assert_response :success
  end

  test "should create emotion" do
    assert_difference('Emotion.count') do
      post emotions_url, params: { emotion: { appearance: @emotion.appearance, emotions: @emotion.emotions, expressions: @emotion.expressions, facesCount: @emotion.facesCount, timeStamp: @emotion.timeStamp } }, as: :json
    end

    assert_response 201
  end

  test "should show emotion" do
    get emotion_url(@emotion), as: :json
    assert_response :success
  end

  test "should update emotion" do
    patch emotion_url(@emotion), params: { emotion: { appearance: @emotion.appearance, emotions: @emotion.emotions, expressions: @emotion.expressions, facesCount: @emotion.facesCount, timeStamp: @emotion.timeStamp } }, as: :json
    assert_response 200
  end

  test "should destroy emotion" do
    assert_difference('Emotion.count', -1) do
      delete emotion_url(@emotion), as: :json
    end

    assert_response 204
  end
end
