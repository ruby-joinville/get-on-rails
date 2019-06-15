class ImportsController < ApplicationController
  
  def artist
  	
  	if import_artist_params[:name].blank?
      redirect_to artists_path, notice: 'Please inform an artist'

      return
    end

  	client = DiscogsRequestsService::Client.new
    artist = client.get_artist(import_artist_params[:name])

    Artist.new(name: artist.name, profile: artist.profile, user: current_user).save

    redirect_to artists_path
  end

  def artist_releases

  	if import_artist_releases_params[:max_results].blank?
      redirect_to artist_releases_path, notice: 'Please inform a number'

      return
    end

    client = DiscogsRequestsService::Client.new
    artist = Artist.find(params['artist_id']).name

    releases = client.search_artist_releases(artist, max_results: import_artist_releases_params[:max_results])

    releases.each do |r|
    	release = Release.new(title: r.title, release_type: r.type, 
    						  year: r.year, discog_id: r.discog_id, artist_id: params['artist_id'])
    	release.save
    end

    redirect_to artist_releases_url(artist_id: params['artist_id'].to_i), notice: 'Releases imported sucesfully.'
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