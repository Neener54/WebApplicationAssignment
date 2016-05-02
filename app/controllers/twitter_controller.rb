class TwitterController < ApplicationController
	def search
		@client = Twitter::REST::Client.new do |config|
	      config.consumer_key        = ENV["CONSUMER_KEY"]
	  	  config.consumer_secret     = ENV["CONSUMER_SECRET"]
	  	  config.access_token        = ENV["ACCESS_TOKEN"]
	  	  config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
	  	end
	    begin
	      user = @client.user("#{params[:search]}")
	      unless user.nil?
	        @timeline = @client.user_timeline("#{params[:search]}")
	        @user = @timeline.first
	      end
	    rescue Exception => e
          raise e
        end
     end
end
