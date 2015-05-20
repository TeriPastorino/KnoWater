git require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    context "uid" do
      it "validates presence of uid" do
        user = FactoryGirl.build(:user, uid: nil)
        expect(user.valid?).to eq(false)
        expect(user.errors[:uid].count).to eq(1)
        user.uid = "foobarbaz"
        expect(user).to be_valid
      end
    end

    context "provider" do
      it "validates presence of provider" do
        user = FactoryGirl.build(:user, provider: nil)
        expect(user.valid?).to eq(false)
        expect(user.errors[:provider].count).to eq(1)
        user.provider = "twitter"
        expect(user).to be_valid
      end
    end

    context "only allow 'twitter' as the provider" do
      it "validates login by 'twitter' only" do
      user = FactoryGirl.build(:user, provider: "facebook")
      expect(user.valid?).to eq(false)
      expect(user.errors[:provider].count).to eq(1)
      user.provider = "twitter"
      expect(user).to be_valid
    end
  end
end


  

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
  



