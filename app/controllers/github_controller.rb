require 'net/http'
require 'json'
 
class GithubController < ApplicationController
  def search
    url = 'https://api.github.com/users/ankitchachada'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @data = JSON.parse(response)
  end
end
