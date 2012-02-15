Capybara.server_port = 3001
# Capybara.app_host = 'localhost:3001'
Capybara.server do |app, port|
  require 'rack/handler/thin'
  Thin::Logging.silent = true
  Rack::Handler::Thin.run(app, :Port => port)
end
