require 'test_helper'

class FaceVideoAnalysesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @face_video_analysis = face_video_analyses(:one)
  end

  test "should get index" do
    get face_video_analyses_url, as: :json
    assert_response :success
  end

  test "should create face_video_analysis" do
    assert_difference('FaceVideoAnalysis.count') do
      post face_video_analyses_url, params: { face_video_analysis: { notes: @face_video_analysis.notes } }, as: :json
    end

    assert_response 201
  end

  test "should show face_video_analysis" do
    get face_video_analysis_url(@face_video_analysis), as: :json
    assert_response :success
  end

  test "should update face_video_analysis" do
    patch face_video_analysis_url(@face_video_analysis), params: { face_video_analysis: { notes: @face_video_analysis.notes } }, as: :json
    assert_response 200
  end

  test "should destroy face_video_analysis" do
    assert_difference('FaceVideoAnalysis.count', -1) do
      delete face_video_analysis_url(@face_video_analysis), as: :json
    end

    assert_response 204
  end
end
