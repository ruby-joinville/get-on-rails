class ReleasesController < ApplicationController
  def index
    @artist = Artist.find(params[:artist_id])

    @releases = @artist.releases
  end

  def show
    @artist = Artist.find(params[:artist_id])
    @release = Release.find(params[:id])
  end
end
