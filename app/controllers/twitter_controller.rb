class TwitterController < ApplicationController
	def search
		@client = Twitter::REST::Client.new do |config|
	      config.consumer_key        = ENV["CONSUMER_KEY"]
	  	  config.consumer_secret     = ENV["CONSUMER_SECRET"]
	  	  config.access_token        = ENV["ACCESS_TOKEN"]
	  	  config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
	  	end
	    begin
	      @timeline = @client.user_timeline("#{params[:search]}")
	    rescue Exception => e
          puts e
        end
     end
end
