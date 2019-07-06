require 'rails_helper'

RSpec.describe DiscogsRequestsService, type: :service do
  subject(:discogs_client) { described_class::Client.new }

  describe '#search_artist_releases' do
    context 'when artist exists' do
      it 'gets an artist releases successfully' do
        VCR.use_cassette('discogs_api_tutorial/services/discogs/get_artist_the_who_releases') do
          response = discogs_client.search_artist_releases('The Who')

          expect(response.first.title).to eq("I Can't Explain")
        end
      end
    end

    context 'when artist does not exists' do
      it 'returns an empty hash' do
        VCR.use_cassette('discogs_api_tutorial/services/discogs/get_artist_gdjey537bdgfajj1wqe') do
          response = discogs_client.search_artist_releases('gdjey537bdgfajj1wqe')

          expect(response).to eq({})
        end
      end
    end
  end

  describe '#get_artist' do
    context 'when artist exists' do
      it 'gets an artist successfully' do
        VCR.use_cassette('discogs_api_tutorial/services/discogs/get_artist_the_who') do
          response = discogs_client.get_artist('The Who')

          expect(response.name).to eq('The Who')
        end
      end
    end

    context 'when artist does not exists' do
      it 'returns an empty hash' do
        VCR.use_cassette('discogs_api_tutorial/services/discogs/get_artist_tegdcjbg4vb4422nann') do
          response = discogs_client.get_artist('tegdcjbg4vb4422nann')

          expect(response).to eq({})
        end
      end
    end
  end
end
