class Group < ApplicationRecord

  validates :name, presence: true, length: { minimum: 5 }

  belongs_to :user
  has_many   :group_times, dependent: :destroy
  has_many   :time_spents, through: :group_times
end
