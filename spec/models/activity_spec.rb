require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe "Attributes" do
    describe "#high_efficiency" do
      it "has a default value of false" do
        activity = Activity.new
        # expect([the activities high efficiency attribute]) to be false
        expect(activity.high_efficiency).to eq(false)
      end
    end
  end
  describe "Validations" do
    describe "#activity_type" do
      it "does not allow nil for activity_type" do
        activity = FactoryGirl.build(:activity, activity_type: nil)
        expect(activity.valid?).to eq(false)
        expect(activity.errors[:activity_type].count).to eq(1)
        activity.activity_type = "shower"
        expect(activity).to be_valid
      end
      
      it "allows shower for activity_type" do
        activity = FactoryGirl.build(:activity, activity_type: "shower")
        expect(activity.valid?).to eq(true)
      end

      it "does not allow 'foo' for activity_type" do
        activity = FactoryGirl.build(:activity, activity_type: "foo")
        expect(activity).to_not be_valid
        expect(activity.errors[:activity_type].count).to eq(1)
      end
    end

    describe "#per_use" do
      it "does not allow nil" do
        activity = FactoryGirl.build(:activity, per_use: nil)
        expect(activity).to_not be_valid
        expect(activity.errors[:per_use].count).to eq(1)
        activity.per_use = 2
        expect(activity).to be_valid
      end

      it "must be a number" do
        activity = FactoryGirl.build(:activity, per_use: "a")
        expect(activity).to be_invalid
        expect(activity.errors[:per_use].count).to eq(1)
        activity.per_use = 2
        expect(activity).to be_valid
      end
    end

    describe '#user' do
      it "must be present" do
        user = FactoryGirl.build(:activity, user: nil)
        expect(activity).to be_invalid
        expect(activity.errors[:user].count).to eq(1)
        user = User.new
        expect(user).to be_present        
      end              
    end
    # per_use
    #   the per_use can't be blank
    #   it must be a number (google validates number rails)
    #   validates presence of user
  end
  describe "Callbacks" do
    describe "to ounce conversion before save" do
      let(:activity) {FactoryGirl.build(:activity, activity_type: "shower", per_use: 2, high_efficiency: high_efficiency)}

      context "when High Efficiency is true" do
        let(:high_efficiency) { true }
        it "converts 2 minutes in a shower to 256oz" do
          expect {activity.save}.to change {activity.ounces}.to(512)
        end
      end
      context "when High Efficiency is false" do
        let(:high_efficiency) { false }
        it "converts 2 minutes in a shower to 512oz" do
          expect {activity.save}.to change {activity.ounces}.to(1024)
        end
      end
    end
  end
end

# expect(user.valid?).to eq(false)
#         expect(user.errors[:provider].count).to eq(1)
#         user.provider = "twitter"
#         [object].[attribute] = valid_value

#         expect(user).to be_valid