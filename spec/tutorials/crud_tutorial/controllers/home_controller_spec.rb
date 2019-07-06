require 'rails_helper'

 RSpec.describe HomeController, type: :controller do
  let(:user) { create(:user) }

  before { sign_in(user) }

  describe 'GET show' do
    it 'shows home' do
      get :show

      expect(response).to be_successful
    end
  end
end
