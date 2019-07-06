require 'rails_helper'

RSpec.describe ReleasesController, type: :routing do
  describe 'routing' do
    let(:the_answer) { '42' }

    it 'routes to #index' do
      expect(get: '/artists/42/releases').to route_to('releases#index', artist_id: the_answer)
    end

    it 'routes to #new' do
      expect(get: '/artists/42/releases/new').to route_to('releases#new', artist_id: the_answer)
    end

    it 'routes to #show' do
      expect(get: '/artists/42/releases/1').to route_to('releases#show', artist_id: the_answer, id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/artists/42/releases/1/edit').to route_to('releases#edit', artist_id: the_answer, id: '1')
    end

    it 'routes to #create' do
      expect(post: '/artists/42/releases/',).to route_to('releases#create', artist_id: the_answer)
    end

    it 'routes to #update via PUT' do
      expect(put: '/artists/42/releases/1').to route_to('releases#update', artist_id: the_answer, id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/artists/42/releases/1').to route_to('releases#update', artist_id: the_answer, id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/artists/42/releases/1').to route_to('releases#destroy', artist_id: the_answer, id: '1')
    end
  end
end
