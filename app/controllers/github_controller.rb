require 'net/http'
require 'json'
 
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
  	 puts e
    end
  end
end
