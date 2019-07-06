require 'rails_helper'

RSpec.describe Release, type: :model do
  let(:artist) { create(:artist) }

  it 'belongs to artist' do
    release = create(:release, artist: artist)

    expect(release.artist).to eq(artist)
  end
end
