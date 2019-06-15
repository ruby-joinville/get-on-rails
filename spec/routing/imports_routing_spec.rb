require "rails_helper"

RSpec.describe ImportsController, type: :routing do
  describe 'routing' do
    it 'routes to artist' do
      expect(:post => '/artists/import').to route_to('imports#artist')
    end

    it 'routes to artist_releases' do
      expect(:post => '/artists/42/releases/import').to route_to('imports#artist_releases', :artist_id => '42')
    end
  end
end
