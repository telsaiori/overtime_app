class Post < ApplicationRecord
  scope :posts_by, ->(user) { where(user_id: user.id)}
  enum status: { submitted: 0, approved: 1, rejected: 2}
  validates :date, :rationale, presence: true
  belongs_to :user


  def self.full_name
    "#{last_name}, #{first_name}" 
  end
end
