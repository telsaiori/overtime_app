class AuditLogsController < ApplicationController

  def index
    @audit_logs = AuditLog.page(params[:page])
    authorize @audit_logs
  end

  def confirm
    audit_log = AuditLog.find(params[:id])
    authorize audit_log
    audit_log.confirmed!
    redirect_to root_path, notice: 'Thank you, Your confirmation has been successfully made'
  end

  def my_auditlog
    user = current_user
    @my_auditlogs = AuditLog.where(user_id: user.id)

  end
end
