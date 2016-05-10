YOUTUBE_API_SERVICE_NAME = 'youtube'
YOUTUBE_API_VERSION = 'v3'
require 'google/api_client'
#@Comment Having constants being declared in the controller is probably not a
#great idea.
#
#Again the configuration in the controller is not optimal
#
#This controller is really large and doing too much
class YoutubeController < ApplicationController

  def search
  	client = Google::APIClient.new(
               :key => ENV['GOOGLE_API_KEY'],
               :authorization => nil,
               :application_name => "Web",
               :application_version => '1.0.0'
     )
     youtube = client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)
      begin
    # Call the search.list method to retrieve results matching the specified
    # query term.
    search_response = client.execute!(
      :api_method => youtube.search.list,
      :parameters => {
        :part => 'snippet',
        :q => params[:search],
        :maxResults => 10
      }
    )

    videos_h = {}
    @videos = []
    #Displaying List of Videos
    search_response.data.items.each do |search_result|
     if search_result.id.kind == 'youtube#video'
        puts search_result.snippet.title
        videos_h = {:title => search_result.snippet.title,:description => search_result.snippet.description,:url => "http://www.youtube.com/embed/#{search_result.id.videoId}"}
        puts videos_h
        @videos << videos_h
     end
    end
  rescue Google::APIClient::TransmissionError => e
    puts e.result.body
  end


  end
end
