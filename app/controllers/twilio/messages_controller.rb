class Twilio::MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    body = params['Body']
    spotify = Spotify.new(ENV['SPOTIFY_USER_ID'], ENV['SPOTIFY_TOKEN'], ENV['SPOTIFY_REFRESH_TOKEN']) 

    track = spotify.strack_search(body)
    message = "Did you want to add _#{track.name}_ by _#{track.artists.map(&:name).to_sentence}_?"
    response = Twilio::TwiML::MessagingResponse.new
    response.message(body: message)
    render xml: response.to_xml
  end

end