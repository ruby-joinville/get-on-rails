require 'rails_helper'

 RSpec.describe HomeController do
  let(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe 'GET show' do
    it 'shows home' do
      get :show

      expect(response).to be_successful
    end
  end
end
