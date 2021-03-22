class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5 }
  validates_uniqueness_of :name, on: :create, message: 'This name is already taken!'

  has_many :time_spents, dependent: :destroy, foreign_key: 'author_id'
  has_many :groups, dependent: :destroy
end
