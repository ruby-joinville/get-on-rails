class ReleasesController < ApplicationController
  def index
    @artist = Artist.find(params[:artist_id])

    @releases = @artist.releases
  end

  def show
    @artist = Artist.find(params[:artist_id])
    @release = Release.find(params[:id])
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @release = Release.new(artist: @artist)
  end

  def create
    @release = Release.new(release_params)
    @artist = Artist.find(params[:artist_id])
    @release.artist = @artist

    if @release.save
      redirect_to artist_release_url(artist_id: @artist.id, id: @release.id), notice: 'Release was successfully created.'
    else
      render :new
    end
  end

  private

  def release_params
    params.require(:release).permit(
      :title
    )
  end
end
