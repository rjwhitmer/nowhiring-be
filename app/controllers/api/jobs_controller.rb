class Api::JobsController < ApplicationController
    def index
        @jobs = Job.all
        render json: @jobs, except: %i[created_at updated_at]
    end

    def show
        @job = Job.find(params[:id])
        render json: @job, except: %i[created_at updated_at]
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Job not found" }, status: :not_found
    end

    def create
        @job = Job.new(job_params)

        if @job.save!
            render json: @job, except: %i[created_at updated_at]
        else
            render json: @order.errors
        end
    end

    def job_params
        params.require(:job).permit(:title, :description, :starting_base_salary_range, :ending_base_salary_range, :hourly_wage, :is_hourly_wage, :is_active, :expected_start_date)
    end
end
