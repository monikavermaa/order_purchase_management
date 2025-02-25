require 'rails_helper'

RSpec.describe PrefectureCode, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:souko_zaikos) }
  end

  describe "validations" do
    it { is_expected.to validate_inclusion_of(:ew_flag).in_array(['EAST', 'WEST']) }

    it "is invalid if ew_flag is not 'EAST' or 'WEST'" do
      invalid_prefecture_code = PrefectureCode.new(ew_flag: 'SOUTH')
      expect(invalid_prefecture_code).to_not be_valid
      expect(invalid_prefecture_code.errors[:ew_flag]).to include("is not included in the list")
    end

    it "is valid when ew_flag is 'EAST' or 'WEST'" do
      valid_prefecture_code = PrefectureCode.new(ew_flag: 'EAST')
      expect(valid_prefecture_code).to be_valid

      valid_prefecture_code.ew_flag = 'WEST'
      expect(valid_prefecture_code).to be_valid
    end
    
  end
end
