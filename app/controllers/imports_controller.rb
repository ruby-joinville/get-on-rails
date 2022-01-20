class ImportsController < ApplicationController
  def artist
    if import_artist_params[:name].blank?
      redirect_to artists_path, notice: 'Please inform an artist'

      return
    end

    ImportArtistWorker.perform_async(import_artist_params[:name], current_user.id)

    redirect_to artists_path, notice: 'Your artist will be imported shortly.'
  end

  def artist_releases
    client = DiscogsRequestsService::Client.new
    artist_name = Artist.find(params['artist_id']).name
    releases = client.search_artist_releases(artist_name, max_results: import_artist_releases_params[:max_results])

    releases.each do |release|
      Release.new(
        title: release.title,
        release_type: release.type,
        year: release.year,
        discog_id: release.id,
        artist_id: params['artist_id']
      ).save
    end

    redirect_to artist_releases_url(artist_id: params['artist_id'].to_i), notice: 'Releases successfully imported.'
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
