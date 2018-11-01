require 'rails_helper'

RSpec.describe MainController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'post global_search' do
    it 'checking for successful' do
      post :global_search
     
      expect(response).to have_http_status(:success)
    end
  end

  describe 'post global_search' do
    it 'checking for successful' do
      post :global_search
      expect(response).to render_template('global_search')
    end
  end




end
