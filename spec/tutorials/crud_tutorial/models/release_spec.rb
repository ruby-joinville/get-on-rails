require 'rails_helper'

RSpec.describe Artist, type: :model do
  let(:artist) { create(:artist) }
  let!(:release) { create(:release, artist: artist)}

  it 'belongs to artist' do
    expect(release.artist).to eq(artist)
  end
end
