class TimeSpent < ApplicationRecord

  validates :name, presence: true, length: { minimum: 5 }

  belongs_to :author, class_name: 'User'
  has_many   :group_times, dependent: :destroy
  has_many   :groups, through: :group_times
end
