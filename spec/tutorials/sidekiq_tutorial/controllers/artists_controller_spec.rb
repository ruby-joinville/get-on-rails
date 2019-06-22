require 'rails_helper'

RSpec.describe ArtistsController, type: :controller do
  let(:user) { create(:user) }
  let(:artist) { create(:artist, user: user) }
  let(:valid_attributes) {
    {
      name: Faker::Movies::HitchhikersGuideToTheGalaxy.character,
      profile: Faker::Movies::HitchhikersGuideToTheGalaxy.quote,
      user_id: user.id
    }
  }
  let(:invalid_attributes) {
    {
      name: Faker::Movies::HitchhikersGuideToTheGalaxy.character,
      profile: Faker::Movies::HitchhikersGuideToTheGalaxy.quote,
      user_id: nil
    }
  }

  before do
    sign_in(user)
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index

      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: artist.to_param }

      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new

      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: { id: artist.to_param }

      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Artist" do
        expect {
          post :create, params: { artist: valid_attributes }
        }.to change(Artist, :count).by(1)
      end

      it "redirects to the created artist" do
        post :create, params: { artist: valid_attributes}

        expect(response).to redirect_to(Artist.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { artist: invalid_attributes }

        expect(response.status).to be(302)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          name: 'Name',
          description: 'New description',
          value: 0.0,
          user_id: user.id
        }
      }

      it "updates the requested artist" do
        put :update, params: { id: artist.to_param, artist: new_attributes }

        artist.reload

        expect(artist.name).to eq(new_attributes[:name])
      end

      it "redirects to the artist" do
        put :update, params: { id: artist.to_param, artist: new_attributes }

        expect(response).to redirect_to(artist)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: { id: artist.to_param, artist: invalid_attributes }

        expect(response.status).to be(302)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested artist" do
      expect {
        delete :destroy, params: { id: artist.to_param }
      }.to change(Artist, :count).by(0)
    end

    it "redirects to the artists list" do
      delete :destroy, params: { id: artist.to_param }

      expect(response).to redirect_to(artists_url)
    end
  end
end
