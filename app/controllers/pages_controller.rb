class PagesController < ApplicationController
    def main
        @client = Client.new
        
        # recos = client.get_recos
        # track_id = "0v7C43pgI20CTbWiktCO0O"
        track_id = "3ctALmweZBapfBdFiIVpji"
        @track_info = @client.get_track(track_id)
        @analysis = @client.get_analysis(track_id)
        @features = @client.get_features(track_id)

        
    end

    def landing
        @track = Track.new
        

    end

    def track_params
        params[:track_id]
    end
end