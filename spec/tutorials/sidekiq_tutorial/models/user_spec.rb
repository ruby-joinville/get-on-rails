require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it 'has many artists' do
    artist = create(:artist, user: user)

    expect(user.artists.first).to eq(artist)
  end
end
