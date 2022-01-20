class ImportArtistWorker
  include Sidekiq::Worker

  def perform(artist_name, user_id)
    client = DiscogsRequestsService::Client.new
    artist = client.get_artist(artist_name)

    Artist.new(name: artist.name, profile: artist.profile, user_id: user_id).save
  end
end