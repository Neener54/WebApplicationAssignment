require 'net/http'
require 'json'
#@Comment - In General you'll want avoid doing http requests in the controller
#A better way would be to create a small class to handle that piece of logic
#
#Avoid mixing tabs and spaces (this is a minor nitpick) in the Ruby Community
#it is generally considered correct to use 2 spaces. This didn't affect our
#decision, just some advice.
class GithubController < ApplicationController
  def search
    response = get_data("https://api.github.com/users/#{params[:search]}")
    @data = JSON.parse(response)
    if @data["message"].nil?
      @repos = JSON.parse(get_data(@data["repos_url"]))
    end
  end

  def get_data(url)
  	begin
  	  Net::HTTP.get(URI(url))
    rescue Exception => e
  	 puts "#{e}"
    end
  end
end
