class StaticController < ApplicationController

  def homepage
    if admin_types.include?(current_user.type)
      @pending_approvals = Post.submitted
      @recent_audit_items = AuditLog.last(10)
    else
      @pending_audit_confirmations = current_user.audit_logs.pending.by_start_date
      @week_start = Date.today.beginning_of_week
      @week_end = Date.today.beginning_of_week
      @no_overtime_week = Post.where(date: @week_start..@week_end)
    end
  end
end
