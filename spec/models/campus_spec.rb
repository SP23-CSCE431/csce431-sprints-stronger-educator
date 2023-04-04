require 'rails_helper'

RSpec.describe Campus, type: :model do
  context "when creating a new campus" do
    it "should be valid with valid attributes" do
      campus = Campus.new(id: 1, name: "Test Campus", district_id: 1)
      expect(campus).to be_valid
    end
  end
end
