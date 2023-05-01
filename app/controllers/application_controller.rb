class ApplicationController < ActionController::Base
  # Skipping CSRF token validation here for now.
  skip_forgery_protection
end
