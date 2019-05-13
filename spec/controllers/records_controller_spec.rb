require 'rails_helper'

RSpec.describe RecordsController, type: :controller do
  let(:user) { create(:user) }
  let(:record) { create(:record, user: user) }
  let(:valid_attributes) {
    {
      name: Faker::Movies::HitchhikersGuideToTheGalaxy.character,
      description: Faker::Movies::HitchhikersGuideToTheGalaxy.quote,
      value: Random.new.rand(0.0..9.9),
      user_id: user.id
    }
  }
  let(:invalid_attributes) {
    {
      name: Faker::Movies::HitchhikersGuideToTheGalaxy.character,
      description: Faker::Movies::HitchhikersGuideToTheGalaxy.quote,
      value: Random.new.rand(0.0..9.9),
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
      get :show, params: { id: record.to_param }

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
      get :edit, params: { id: record.to_param }

      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Record" do
        expect {
          post :create, params: { record: valid_attributes }
        }.to change(Record, :count).by(1)
      end

      it "redirects to the created record" do
        post :create, params: { record: valid_attributes}

        expect(response).to redirect_to(Record.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { record: invalid_attributes }

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

      it "updates the requested record" do
        put :update, params: { id: record.to_param, record: new_attributes }

        record.reload

        expect(record.name).to eq(new_attributes[:name])
      end

      it "redirects to the record" do
        put :update, params: { id: record.to_param, record: new_attributes }

        expect(response).to redirect_to(record)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: { id: record.to_param, record: invalid_attributes }

        expect(response.status).to be(302)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested record" do
      expect {
        delete :destroy, params: { id: record.to_param }
      }.to change(Record, :count).by(0)
    end

    it "redirects to the records list" do
      delete :destroy, params: { id: record.to_param }

      expect(response).to redirect_to(records_url)
    end
  end
end
