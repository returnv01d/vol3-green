require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #create_allergic_prefs" do
    it "returns http success" do
      get :create_allergic_prefs
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit_allergic_prefs" do
    it "returns http success" do
      get :edit_allergic_prefs
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #delete_allergic_prefs" do
    it "returns http success" do
      get :delete_allergic_prefs
      expect(response).to have_http_status(:success)
    end
  end

end
