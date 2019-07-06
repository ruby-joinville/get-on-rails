require 'rails_helper'

RSpec.describe ImportArtistWorker, type: :worker do
  let(:user) { create(:user) }

  describe 'perform' do
    it 'creates an Artist called Raul Seixas' do
      VCR.use_cassette('workers/import_artist_worker/import_raul_seixas') do
        described_class.new.perform('Raul Seixas', user.id)

        expect(Artist.where(name: 'Raul Seixas').first.name).to eq('Raul Seixas')
      end
    end
  end
end
