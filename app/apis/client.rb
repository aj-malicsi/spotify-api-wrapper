require 'faraday'

class Client

    BASE_URL = "https://api.spotify.com"
    
    def get_track(track_id)
        request(http_method: :get, 
        endpoint: "/v1/tracks/#{track_id}")
    end


    def get_analysis(track_id)
        request(http_method: :get, 
        endpoint: "/v1/audio-analysis/#{track_id}")
    end

    def get_features(track_id)
        request(http_method: :get, 
        endpoint: "/v1/audio-features/#{track_id}")
    end

    private
    def connection
        @connection ||= Faraday.new(
            url: BASE_URL,
            headers:{
                "Authorization" => "Bearer BQA0R6W0Pv29u2ZZEZ2nU09rljl-OhacdklUSVcMD_0YRSNM6pIH0qpBpcZyIrohUkx7mNmvTGOAOHQ7WdsC2C4hxb6Spb0QnppTxpS7TuRcJ67c6961cN0V5lhyPFtt3fU4ALBT62OmGuK0"
            },
        )
    end

    def request(http_method:, endpoint:)
        response = connection.public_send(http_method, endpoint)
        parsed_response = JSON.parse(response.body)
        # if @response.status == 200
        #     return parsed_response
        # end
    end

end