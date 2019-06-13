class ReleasesController < ApplicationController
  def index
    @artist = Artist.find(params[:artist_id])

    @releases = @artist.releases
  end
end
