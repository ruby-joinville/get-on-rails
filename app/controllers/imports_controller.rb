class ImportsController < ApplicationController
    def artist
        if import_artist_params[:name].blank?
            redirect_to artists_path, notice: 'Por favor, informe um artista'
            
            return        
        end

        client = DiscogsRequestsService::Client.new
        artist = client.get_artist(import_artist_params[:name])

        Artist.new(name: artist.name, profile: artist.profile, user: current_user).save
        redirect_to artists_path
    end

    def artist_releases
        artist = Artist.find(params[:artist_id])
        client = DiscogsRequestsService::Client.new
        artist_releases = client.search_artist_releases(artist[:name], import_artist_releases_params[:max_results])  

        artist_releases.each do |release|
            Release.new(artist: artist, year: release.year, title: release.title).save
        end
        
        redirect_to artist_releases_url, notice: 'Releases successfully imported'
    end
    

    private

    def import_artist_params
        params.require(:import_artist).permit(
        :name
        )
    end

    def import_artist_releases_params
        params.require(:import_artist_releases).permit(
            :max_results
        )
    end
end