require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let!(:artist) { create(:artist, user: user) }

  it 'has many artists' do
    expect(user.artists.first).to eq(artist)
  end
end
