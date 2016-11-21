require 'httparty'

class Kele
    include HTTParty
    
    base_uri 'https://www.bloc.io/api/v1'
    
    def initialize(email, password)
        response = self.class.post(api_url("sessions"), body: { email: email, password: password })
        #binding.pry
        raise "Invalid email/password" if response.code != 200
        @auth_token = response["auth_token"]
    end

    private
    def api_url(endpoint)
       "https://www.bloc.io/api/v1/#{endpoint}" 
    end
end
