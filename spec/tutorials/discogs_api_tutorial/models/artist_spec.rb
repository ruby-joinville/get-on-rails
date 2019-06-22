require 'rails_helper'

RSpec.describe Artist, type: :model do
  let(:user) { create(:user) }
  let(:artist) { create(:artist, user: user) }
  let!(:release) { create(:release, artist: artist)}

  it 'has many releases' do
    expect(artist.releases.first).to eq(release)
  end

  it 'belongs to user' do
    expect(artist.user).to eq(user)
  end
end
