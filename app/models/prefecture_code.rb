class PrefectureCode < ApplicationRecord
  validates :ew_flag, presence: true
  has_many :souko_zaikos, dependent: :nullify
end
