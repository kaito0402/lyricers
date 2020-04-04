require 'rails_helper'

describe TweetsController do
  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  

  describe 'GET #index' do
    it "@tweetsの値と並び順のテスト" do
      tweets = create_list(:tweet,3)
      get :index
      expect(assigns(:tweets)).to match(tweets.sort{ |a, b| b.created_at <=> a.created_at } )
    end
    it "render the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end