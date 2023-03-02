require "test_helper"

class Api::V1::IssuesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_issues_index_url
    assert_response :success
  end

  test "should get issue" do
    get api_v1_issues_issue_url
    assert_response :success
  end

  test "should get return" do
    get api_v1_issues_return_url
    assert_response :success
  end
end
