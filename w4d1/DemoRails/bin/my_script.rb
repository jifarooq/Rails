# bin/my_script.rb
require 'addressable/uri'
require 'rest-client'
def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.html'
    ).to_s
  
  puts RestClient.post(
    url,
    { user: { name: "Popeye"} }
  )
  
end

def update_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/1.html'
    ).to_s
  
  puts RestClient.patch(
    url,
    { user: { name: "Markov", email: "markov@aol.com" } }
  )
  
end

def destroy_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/2.html'
    ).to_s
  
  puts RestClient.delete url
  
end

destroy_user
