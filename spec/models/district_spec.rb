require 'rails_helper'

RSpec.describe District, type: :model do
  context "when creating a new district" do
    it "should be valid with valid attributes" do
      district = District.new(id: 1, name: "Test District", district_id: "1")
      expect(district).to be_valid
    end

    it "should not be valid without a name" do
      district = District.new(id: 1, name: nil, district_id: "1")
      expect(district).to_not be_valid
    end
  end
end
