require 'rails_helper'

RSpec.describe User, type: :model do
  describe ".find_or_create_by_omniauth" do
    context "when a user exists with the uid" do
      let(:user) { FactoryGirl.create(:user) }
      let(:auth_hash) do
        {
          provider: "twitter",
          uid: user.uid,
          info: {name: user.name }
        }
      end

      it "finds the existing user" do
        found_user = User.find_or_create_by_omniauth(auth_hash)
        expect(found_user).to eq(user)
      end
    end
    context "when a user does not exist with the uid" do
      let(:auth_hash) do
        {
          provider: "twitter",
          uid: "12345",
          info: {name: "Teri" }
        }
      end

      it "creates the new user with the appropriate attrs" do
        user = User.find_or_create_by_omniauth(auth_hash)
        expect(user.provider).to eq(auth_hash[:provider])
        expect(user.uid).to eq(auth_hash[:uid])
        expect(user.name).to eq("Teri")
      end
    end
  end
end
