require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe "Validations" do
    describe "#activity_type" do
      it "does not allow nil for activity_type"
      it "allows shower for activity_type"
      it "does not allow 'foo' for activity_type"
    end
  end
  describe "Callbacks" do
    describe "to ounce conversion before save" do
      let(:activity) {FactoryGirl.create(:activity, activity_type: "shower", per_use: 2, high_efficiency: high_efficiency)}

      context "when High Efficiency is true" do
        let(:high_efficiency) { true }
        it "converts 2 minutes in a shower to 256oz" do
          expect {activity.save}.to change {activity.ounces}.to(256)
        end
      end
      context "when High Efficiency is false" do
        let(:high_efficiency) { false }
        it "converts 2 minutes in a shower to 512oz"
      end
    end
  end
end
