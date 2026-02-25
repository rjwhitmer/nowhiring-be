class Api::V1::HomeController < ActionController::Base
    def index
        render json: { message: "Welcome to the Now Hiring API!" }
    end
end