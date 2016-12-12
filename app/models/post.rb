class Post < ApplicationRecord
  validates :date, :rationale, presence: true
  belongs_to :user


  def self.full_name
    "#{last_name}, #{first_name}" 
  end
end
