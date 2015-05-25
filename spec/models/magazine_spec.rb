require "rails_helper"

describe Magazine do
	describe "validations" do
		let(:valid_attributes) {
			{
				title: "Field and Stream",
				edition: 10,
				issue: Date.today,
				language: "English"
			}
		}
		it "can be valid" do
			magazine = Magazine.new(valid_attributes)

			expect(magazine.valid?).to eq true
		end

		it "is invalid without a title" do
			valid_attributes[:title] = nil
			magazine = Magazine.new(valid_attributes)

			expect(magazine.valid?).to eq false
			expect(magazine.errors[:title]).to eq ["can't be blank"]
		end

		it "is invalid without an edition" do
			valid_attributes[:edition] = nil
			magazine = Magazine.new(valid_attributes)

			expect(magazine.valid?).to eq false
			expect(magazine.errors[:edition]).to eq ["can't be blank"]
		end

		it "is invalid without an issue" do
			valid_attributes[:issue] = nil
			magazine = Magazine.new(valid_attributes)

			expect(magazine.valid?).to eq false
			expect(magazine.errors[:issue]).to eq ["can't be blank"]
		end

		it "is invalid without a language" do
			valid_attributes[:language] = nil
			magazine = Magazine.new(valid_attributes)

			expect(magazine.valid?).to eq false
			expect(magazine.errors[:language]).to eq ["can't be blank"]
		end
	end

	describe "#full_title" do
		it "prints the full title for the magazine" do
			magazine = create_magazine(title: "Field and Stream", edition: 10, issue: "11/11/2011", language: "English")

			expect(magazine.full_title).to eq "Field and Stream Edition 10. Published 11/11/2011 in English"
		end
	end
end