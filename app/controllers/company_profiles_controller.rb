class CompanyProfilesController < ApplicationController
  before_action :set_company_profile, only: %i[ show update destroy ]

  # GET /company_profiles
  def index
    @company_profiles = CompanyProfile.all

    render json: @company_profiles
  end

  # GET /company_profiles/1
  def show
    render json: @company_profile
  end

  # POST /company_profiles
  def create
    @company_profile = CompanyProfile.new(company_profile_params)

    if @company_profile.save
      render json: @company_profile, status: :created, location: @company_profile
    else
      render json: @company_profile.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /company_profiles/1
  def update
    if @company_profile.update(company_profile_params)
      render json: @company_profile
    else
      render json: @company_profile.errors, status: :unprocessable_content
    end
  end

  # DELETE /company_profiles/1
  def destroy
    @company_profile.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_profile
      @company_profile = CompanyProfile.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def company_profile_params
      params.fetch(:company_profile, {})
    end
end
