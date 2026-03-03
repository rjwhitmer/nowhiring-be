class Api::V1::AuthenticatedController < ActionController::Base
    before_action :authenticate

    attr_reader :current_user, :current_api_token

    def authenticate
        authenticate_user_with_token || handle_bad_authentication
      # token = request.headers["Authorization"]&.split(" ")&.last
      # api_token = ApiToken.find_by(token: token)

      # if api_token && api_token.user
      #     @current_user = api_token.user
      # else
      #     render json: { error: "Unauthorized" }, status: :unauthorized
      # end
    end

    private

    def authenticate_user_with_token
        authenticate_with_http_token do |token, _options|
            @current_api_token = ApiToken.where(active: true).find_by(token: token)
            @current_user = @current_api_token&.user
        end
    end

    def handle_bad_authentication
        render json: { error: "Unauthorized" }, status: :unauthorized
    end
end
