class TimeSpent < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5 }
  validates :Amount, presence: true
  validates :Amount,
            numericality: { only_integer: true, greater_than_or_equal_to: 60, less_than_or_equal_to: 720,
                            message: 'Mins should be greater than 60 or less than 720' }

  belongs_to :author, class_name: 'User'
  has_many :group_times, dependent: :destroy
  has_many :groups, through: :group_times

  def get_name(userid)
    @usr = User.select('name').where(id: userid).take
    @usr
  end

  def create_gt(gids)
    gids.each do |g|
      gt = group_times.build(group_id: g)
      gt.save
    end
  end
end
