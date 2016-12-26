class Post < ApplicationRecord
  scope :posts_by, ->(user) { where(user_id: user.id)}
  enum status: { submitted: 0, approved: 1, rejected: 2}
  validates :date, :rationale, :overtime_request, presence: true
  validates :overtime_request, numericality: { greater_than: 0.0 }
  belongs_to :user

  after_save :confirm_audit_log, if: :submitted?
  after_save :un_confirm_audit_log, if: :rejected?


  def self.full_name
    "#{last_name}, #{first_name}" 
  end

  private
    def confirm_audit_log
      audit_log = AuditLog.where(user_id: self.user.id, start_date: (self.date - 7.days..self.date)).last
      audit_log.confirmed! if audit_log
    end

    def un_confirm_audit_log
      audit_log = AuditLog.where(user_id: self.user.id, start_date: (self.date - 7.days..self.date)).last
      audit_log.pending! if audit_log
    end
end
