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

  private

  def import_artist_params
    params.require(:import_artist).permit(
      :name
    )
  end
end
