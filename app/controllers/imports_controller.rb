class ImportsController < ApplicationController
  def artist

    if import_artist_params[:name].blank?
      redirect_to artists_path, notice: 'Please inform an artist'

      return
    end

    client = DiscogsRequestsService::Client.new
    artist = client.get_artist(import_artist_params[:name])

    Artist.new(
    	name: artist.name,
    	profile: artist.profile,
    	user: current_user
    ).save

    redirect_to artists_path
  end

  def artist_releases
  	client = DiscogsRequestsService::Client.new
  	artist_name = Artist.find(params['artist_id']).name
  	releases = client.search_artist_releases(artist_name,max_results: import_artist_releases_params[:max_results])
  	
  	releases.each do |release|
	  	Release.new(
	    	title: release.title,
	    	artist_id: params['artist_id'],
	    	year: release.year
	    ).save
	end

	redirect_to artist_releases_url(artist_id: params['artist_id'].to_i)

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