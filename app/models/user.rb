class User < ApplicationRecord

    validates :name, presence: true, length: { minimum: 5 }
  

    has_many :time_spents, dependent: :destroy, foreign_key: 'author_id'
    has_many :groups, dependent: :destroy
end
