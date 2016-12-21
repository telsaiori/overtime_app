class AuditLogsController < ApplicationController

  def index
    @audit_logs = AuditLog.page(params[:page])
    authorize @audit_logs
  end
end
