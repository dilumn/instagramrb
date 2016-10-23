require 'instagramrb'
require 'reel'

class Sample
  include Celluloid

  # Go to http://instagram.com/developer to get your client ID and client secret.
  CLIENT_ID = "004ee937508648b7aac2c5be8f0c9591"
  CLIENT_SECRET = "c5ca6335af3d4bdd8a1fd7c56945fd6e"

  # Set the redirect uri for your application to the following:
  REDIRECT_URI = "http://localhost:3000/callback"

  def initialize
    @client = Instagramrb.client(
      :client_id => CLIENT_ID,
      :client_secret => CLIENT_SECRET,
      :callback_url => REDIRECT_URI
    )
  end

  def start
    Reel::Server::HTTP.run('0.0.0.0', 3000) do |connection|
      connection.each_request do |request|
        case request.path
        when "/"
          home(request)
        when "/callback"
          callback(request)
        else
          puts "NO nodes"
        end
      end
    end
  end

  def home(request)
    output << "<br /><h3><a href='#{@client.authorize_url}'>Click here</a> to authenticate with Instagram.</h3>"
    request.respond :ok, {"content-type" => "text/html"}, output
  end

  def callback(request)
    @client.get_access_token(request.query_string.partition('=').last)
    output = "Access Token is #{@client.access_token}"
    request.respond :ok, output
  end

end

sample = Sample.new
sample.start
