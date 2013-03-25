# check if it's running on Heroku
if ENV['DATABASE_URL']

  require 'rufus/scheduler'
  scheduler = Rufus::Scheduler.start_new

  scheduler.every '10m' do
    require "net/http"
    require "uri"
    url = "http://#{ENV['APP_HOSTNAME']}"
    Net::HTTP.get_response(URI.parse(url))
  end

end
