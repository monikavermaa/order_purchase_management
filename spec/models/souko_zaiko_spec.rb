require 'rails_helper'

RSpec.describe SoukoZaiko, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:prefecture_code).optional }
  end

  describe "validations" do
    it { is_expected.to validate_inclusion_of(:stock_type).in_array(['01', '02']) }
  end

  describe "valid SoukoZaiko instance" do
    let(:prefecture) { PrefectureCode.create(name: "Tokyo", code: "01", ew_flag: "EAST") }

    context "when all attributes are valid" do
      it "is valid" do
        souko_zaiko = SoukoZaiko.new(
          warehouse_code: "EAST",
          stock_type: "01",
          prefecture_code: prefecture
        )
        expect(souko_zaiko).to be_valid
      end
    end

    context "when stock_type is invalid" do
      it "is invalid with an incorrect stock_type" do
        souko_zaiko = SoukoZaiko.new(
          warehouse_code: "EAST",
          stock_type: "03",
          prefecture_code: prefecture
        )
        expect(souko_zaiko).to be_invalid
        expect(souko_zaiko.errors[:stock_type]).to include("is not included in the list")
      end
    end
  end
end
