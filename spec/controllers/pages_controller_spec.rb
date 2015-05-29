require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #Information" do
    it "returns http success" do
      get :Information
      expect(response).to have_http_status(:success)
    end
  end

end
