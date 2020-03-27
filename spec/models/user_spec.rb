require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a nickname" do
      user = User.new(name: "", email: "p@a", password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
    it "emailがないと保存できない" do
      user = User.new(name: "zyozyo", email: "", password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
  end
end