require 'rails_helper'

RSpec.describe Campus, type: :model do
  context "when creating a new campus" do
    it "should be valid with valid attributes" do
      campus = Campus.new(id: "1", name: "Test Campus", district_id: 1)
      expect(campus).to be_valid
    end

    it "should not be valid without a name" do
      campus = Campus.new(id: "1", name: nil, district_id: 1)
      expect(campus).to_not be_valid
    end

    it "should not be valid without a district_id" do
      campus = Campus.new(id: "1", name: "Test Campus", district_id: nil)
      expect(campus).to_not be_valid
    end
  end
end
