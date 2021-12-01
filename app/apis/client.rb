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
                "Authorization" => "Bearer BQBgkxwsuDT2FWzaCFI8c7tnnrooUaJwQIxwSKezvkCiR8aVGhJuF92JtgW5CWvkRY-qlkJypGFbXaLuyMRmA_SnxhL8fmNlhx6UB2pCzIczc1HJnkqqMrMUMi_HBYU5LZPvOUSJEMaIpdHu"
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