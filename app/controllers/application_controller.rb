class ApplicationController < ActionController::API
  include Authentication
  include ActionController::Helpers
  include ActionController::Cookies
end
