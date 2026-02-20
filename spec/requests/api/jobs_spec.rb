require 'swagger_helper'

RSpec.describe 'api/jobs', type: :request do

  path '/api/jobs' do

    get('list jobs') do
      tags 'Jobs'
      consumes 'application/json'
      produces 'application/json'
      description 'List all the jobs'
      response(200, 'successful') do
        schema type: :array, items: { "$ref" => "#/components/schemas/job" }
        let!(:job1) { Job.create(title: "Rails Dev", description: "Rails developer position") }
        let!(:job2) { Job.create(title: "Ruby Dev", description: "Ruby developer position") }

        after do |example|
          content = example.metadata[:response][:content] || {}
          example_spec = {
            "application/json" => {
              examples: {
                test_example: {
                  value: JSON.parse(response.body, symbolize_names: true)
                }
              }
            }
          }
          example.metadata[:response][:content] = content.deep_merge(example_spec)
        end
        run_test!
      end
    end

    post('create job') do
      tags 'Jobs'
      consumes 'application/json'
      produces 'application/json'
      description 'Create a new job'

      parameter name: :job, in: :body, schema: { "$ref" => "#/components/schemas/job" }

      response(200, 'successful') do
        schema "$ref" => "#/components/schemas/job"

        let!(:job) {
          {
            title: "Rails Dev",
            description: "Rails developer position",
            starting_base_salary_range: 100
          }
        }
        
        # binding.pry
        after do |example|
          content = example.metadata[:response][:content] || {}
          example_spec = {
            "application/json" => {
              examples: {
                test_example: {
                  value: JSON.parse(response.body, symbolize_names: true)
                }
              }
            }
          }
          example.metadata[:response][:content] = content.deep_merge(example_spec)
        end
        run_test!
      end
    end
  end

  path '/api/jobs/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'The ID for the job'

    get('show job') do
      description "Get the details for a specific Job"
      produces 'application/json'
      response(200, 'successful') do
        schema "$ref" => "#/components/schemas/job"

        let(:job) { Job.create(title: "Get Job Test", description: "This is a test for GET route for a specific job", starting_base_salary_range: 120) }
        let(:id) { job.id }

        after do |example|
          content = example.metadata[:response][:content] || {}
          example_spec = {
            "application/json" => {
              examples: {
                test_example: {
                  value: JSON.parse(response.body, symbolize_names: true)
                }
              }
            }
          }
          example.metadata[:response][:content] = content.deep_merge(example_spec)
        end
        run_test!
      end

      response(404, 'not found') do
        schema "$ref" => "#/components/schemas/not_found"

        let(:id) { 9999999999999 }

        after do |example|
          content = example.metadata[:response][:content] || {}
          example_spec = {
            "application/json" => {
              examples: {
                test_example: {
                  value: JSON.parse(response.body, symbolize_names: true)
                }
              }
            }
          }
          example.metadata[:response][:content] = content.deep_merge(example_spec)
        end
        run_test!
      end
    end
  end
end
