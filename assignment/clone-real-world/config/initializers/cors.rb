Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # origins 'http://localhost:3000'
    origins '*'
    resource '*',
             methods: %i[get post put patch delete],
             headers: :any
    # methods: :any, headers: :any
  end
end
