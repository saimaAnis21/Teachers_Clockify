class Group < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5 }
  validates :name,
            format: { with: /\AGrade-\b([1-9]|1[0-2])\b\Z/,
                      message: "Correct format for writing name is 'Grade-x' replace x with the desired grade level " }
  validates_uniqueness_of :name, on: :create, message: 'This group name is already taken!'

  belongs_to :user
  has_many :group_times, dependent: :destroy
  has_many :time_spents, through: :group_times
end
