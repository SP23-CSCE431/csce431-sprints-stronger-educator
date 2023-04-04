require 'rails_helper'

RSpec.describe District, type: :model do
  context "when creating a new district" do
    it "should be valid with valid attributes" do
      district = District.new(id: 1, name: "Test District")
      expect(district).to be_valid
    end
  end
end
