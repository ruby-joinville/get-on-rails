require 'rails_helper'

RSpec.describe ReleasesController, type: :controller do
  let(:user) { create(:user) }
  let(:artist) { create(:artist, user: user) }
  let(:release) { create(:release, artist: artist) }
  let(:valid_attributes) {
    {
      title: Faker::Movies::HitchhikersGuideToTheGalaxy.character,
      artist_id: artist.id
    }
  }
  let(:invalid_attributes) {
    {
      title: Faker::Movies::HitchhikersGuideToTheGalaxy.character,
      artist: nil
    }
  }

  before do
    sign_in(user)
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: { artist_id: artist.to_param }

      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { artist_id: artist.to_param, id: release.to_param }

      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: { artist_id: artist.to_param }

      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: { artist_id: artist.to_param, id: release.to_param }

      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Artist" do
        expect {
          post :create, params: { artist_id: artist.to_param, release: valid_attributes }
        }.to change(Artist, :count).by(1)
      end

      it "redirects to the created release" do
        post :create, params: { artist_id: artist.to_param, release: valid_attributes }

        expect(response).to redirect_to(action: 'show', artist_id: artist.id, id: Release.last.id.to_s)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { artist_id: artist.to_param, release: invalid_attributes }

        expect(response.status).to be(302)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          title: 'Bohemian Rhapsody',
          artist_id: artist.id
        }
      }

      it "updates the requested release" do
        put :update, params: { artist_id: artist.to_param, id: release.to_param, release: new_attributes }

        release.reload

        expect(release.title).to eq(new_attributes[:title])
      end

      it "redirects to the release" do
        put :update, params: { artist_id: artist.to_param, id: release.to_param, release: new_attributes }

        release.reload

        expect(response).to redirect_to(action: 'show', artist_id: artist.id, id: release.id.to_s)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: { artist_id: artist.to_param, id: release.to_param, release: invalid_attributes }

        expect(response.status).to be(302)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested release" do
      expect {
        delete :destroy, params: { artist_id: artist.to_param, id: release.to_param }
      }.to change(Release, :count).by(0)
    end

    it "redirects to the releases list" do
      delete :destroy, params: { artist_id: artist.to_param, id: release.to_param }

      expect(response).to redirect_to(artist_releases_url)
    end
  end
end
