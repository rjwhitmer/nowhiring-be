require "test_helper"

class JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job = jobs(:one)
    @user, @token = sign_in_as(users(:lazaro_nixon))
  end

  def default_headers
    { "Authorization" => "Bearer #{@token}" }
  end

  test "should get index" do
    get jobs_url, as: :json
    assert_response :success
  end

  test "should create job" do
    assert_difference("Job.count") do
      post jobs_url, params: { job: { title: "Create Test", description: "Create Test", starting_base_salary_range: 100 } }, as: :json
    end

    assert_response :created
  end

  test "should show job" do
    get job_url(@job), as: :json
    assert_response :success
  end

  test "should update job" do
    patch job_url(@job), params: { job: { title: "Update Test", description: "Update Test", starting_base_salary_range: 200 } }, as: :json
    assert_response :success
  end

  test "should destroy job" do
    assert_difference("Job.count", -1) do
      delete job_url(@job), as: :json
    end

    assert_response :no_content
  end
end
