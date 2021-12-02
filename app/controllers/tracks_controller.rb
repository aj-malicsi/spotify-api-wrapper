class TracksController < ApplicationController
    before_action :set_track, only: [:show]

    def new
        @track = Track.new
    end

    def show
        @client = Client.new
        track_id = extract_id(@track.track_id)
        

        @track_info = @client.get_track(track_id)
        @analysis = @client.get_analysis(track_id)
        @features = @client.get_features(track_id)
    end

    def create
        @track = Track.find_or_create_by(track_params)

        if @track.save
            redirect_to @track, notice: 'track was successfully created'
        else
            render :new
        end
    end

    private
        def set_track
            @track = Track.find(params[:id])
        end

        def track_params
            params.require(:track).permit(:track_id)
        end

        def extract_id(link_string)
            link_string = link_string.gsub("https://open.spotify.com/track/", "")
            track_id = ""

            link_string.each_char {|c| 
                break if c == "?"
                    track_id = track_id + c      
                }
            
            return track_id

        end
end
