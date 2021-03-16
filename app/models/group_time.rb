class GroupTime < ApplicationRecord

  validates :time_spent_id, presence: true
  validates :group_id, presence: true

  belongs_to :time_spent
  belongs_to :group
end
