class PagesController < ApplicationController
    def main
        @client = Client.new
        # recos = client.get_recos
        # track_id = "0v7C43pgI20CTbWiktCO0O"
        track_id = "3ctALmweZBapfBdFiIVpji"
        @track = @client.get_track(track_id)
        @analysis = @client.get_analysis(track_id)
        @features = @client.get_features(track_id)
        key_arr = ["C","C#/Db", "D", "D#/Eb", "E", "F", "G", "G#/Ab", "A", "A#/Bb", "B"]
        
    end
end