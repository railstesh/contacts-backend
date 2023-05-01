# Enable cors because we have two seperate app for frontend and backend.
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource '*', :headers => :any, :methods => [:get, :post, :put, :options]
  end
end
