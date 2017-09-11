require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #home" do
    it "returns http success and 20 potatos recipes" do
      get :home, params: { :query => "Potato" }

      expect(response).to have_http_status(:success)
      expect(assigns(:recipes).count).to eq 20
      expect(assigns(:recipes).first['title']).to match /Potato/
    end

    it "returns 20 meat mix recipes" do
      get :home, params: { :query => "Meat Mix" }

      expect(response).to have_http_status(:success)
      expect(assigns(:recipes).count).to eq 20
      expect(assigns(:recipes).first['title']).to match /Meat Mix/
    end

    it "return empty array withou params" do
      get :home

      expect(response).to have_http_status(:success)
      expect(assigns(:recipes).count).to eq 0
      expect(assigns(:recipes)).to eq []
    end
  end

end
