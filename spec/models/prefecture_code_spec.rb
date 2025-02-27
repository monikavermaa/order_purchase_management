require 'rails_helper'

RSpec.describe PrefectureCode, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:souko_zaikos) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:ew_flag) }
  end
end
