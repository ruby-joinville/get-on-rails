require 'rails_helper'

RSpec.describe DiscogsRequestsService, type: :service do
  describe '#search_artist_releases' do
    it 'gets an artist releases sussessfully' do
      VCR.use_cassette("get_artist_the_who_releases") do
        response = described_class::Client.new.search_artist_releases('The Who')

        expect(response.first.title).to eq("I Can't Explain")
      end
    end
  end

  describe '#get_artist' do
    it 'gets an artist sussessfully' do
      VCR.use_cassette("get_artist_the_who") do
        response = described_class::Client.new.get_artist('The Who')

        expect(response.name).to eq('The Who')
      end
    end
  end
end
