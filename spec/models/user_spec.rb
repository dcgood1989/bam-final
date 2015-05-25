require "rails_helper"

describe User do
	describe "validations" do
		let(:valid_attributes) {
			{
				username: "Sample User", 
				password: "password", 
				password_confirmation: "password"
			}
		}
		it "can be valid" do
			user = User.new(valid_attributes)

			expect(user.valid?).to eq true
		end

		it "is invalid witout a username" do
			valid_attributes[:username] = nil
			user = User.new(valid_attributes)

			expect(user.valid?).to eq false
			expect(user.errors[:username]).to eq ["can't be blank"]
		end
	end
end