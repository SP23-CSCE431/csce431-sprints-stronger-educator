require 'rails_helper.rb'

RSpec.describe User, type: :model do
  context "when creating a new user" do
    it "should be valid with valid attributes" do
      user = User.new(id: 0, name: "Test User", email: "test@email", campus_id: 1, district_id: 1)
      expect(user).to be_valid
    end
  end
end
