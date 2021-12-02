class TracksController < ApplicationController
    before_action :set_track, only: [:show]

    def new
        @track = Track.new
    end

    def show
        @client = Client.new

        @track_info = @client.get_track(@track.track_id)
        @analysis = @client.get_analysis(@track.track_id)
        @features = @client.get_features(@track.track_id)
    end

    def create
        @track = Track.new(track_params)

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
end
