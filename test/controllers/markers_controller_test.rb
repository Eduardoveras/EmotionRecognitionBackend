require 'test_helper'

class MarkersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @marker = markers(:one)
  end

  test "should get index" do
    get markers_url, as: :json
    assert_response :success
  end

  test "should create marker" do
    assert_difference('Marker.count') do
      post markers_url, params: { marker: { face_video_analysis_id: @marker.face_video_analysis_id, note: @marker.note, time: @marker.time } }, as: :json
    end

    assert_response 201
  end

  test "should show marker" do
    get marker_url(@marker), as: :json
    assert_response :success
  end

  test "should update marker" do
    patch marker_url(@marker), params: { marker: { face_video_analysis_id: @marker.face_video_analysis_id, note: @marker.note, time: @marker.time } }, as: :json
    assert_response 200
  end

  test "should destroy marker" do
    assert_difference('Marker.count', -1) do
      delete marker_url(@marker), as: :json
    end

    assert_response 204
  end
end
