require 'rails_helper'

RSpec.describe ImportsController, type: :controller do
  let(:user) { create(:user) }
  let(:import_artist_attributes) { { name: 'Raul Seixas' } }

  before { sign_in(user) }

  describe 'POST artist' do
    before do
      post :artist, params: { import_artist: import_artist_attributes }
    end

    it 'enqueues a job to the ImportArtistWorker with the correct args' do
      expect(ImportArtistWorker.jobs.size).to eq(1)
      expect(ImportArtistWorker.jobs.first['args']).to eq(['Raul Seixas', user.id])
    end
  end

  describe 'POST artist_releases' do
    let(:artist) { Artist.first }
    let(:import_artist_releases_attributes) do
      { artist_id: artist.id, import_artist_releases: { max_results: 15 } }
    end

    before do
      Artist.new(name: 'Raul Seixas', user: user).save

      VCR.use_cassette('sidekiq_tutorial/controllers/import/import_raul_seixas_releases') do
        post :artist_releases, params: import_artist_releases_attributes
      end
    end

    it 'creates 15 releases for the artist called Raul Seixas' do
      expect(Artist.where(name: 'Raul Seixas').first.releases.count).to eq(15)
    end

    it "creates a release called 'Eu Nasci Há 10 Mil Anos Atrás' for Raul Seixas artist" do
      raul = user.artists.where(name: 'Raul Seixas').first
      wise_raul = raul.releases.where(title: 'Eu Nasci Há 10 Mil Anos Atrás').first

      expect(wise_raul).to be_present
    end
  end
end
