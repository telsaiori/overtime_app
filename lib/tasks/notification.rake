namespace :notification do
  desc "Sends sms notification to employees asking them to log if they had overtime or not"
  task sms: :environment do
    # 1. Schedule to run at Sunday at 5pm
    # 2. Iterate over all employees
    # 3. Skip AdminUsers
    # 4. Send a message that has instructions and a link to log time
    # User.all.each do |user|
    #   SmsTool.send_sms()
    # end

  end

  desc "Check if there are any overtime work didn't report"
  task check_overtime: :environment do 
    employees = User.where(type: nil)
    week_start = Date.today.beginning_of_week
    week_end = Date.today.end_of_week
    no_overtime_week = []
    employees.each do |employee|
      no_overtime_week = employee.posts.where(date: @week_start..@week_end)
      unless no_overtime_week.any?
        AuditLog.create!(user_id: employee.id, status: 0, start_date: week_start, end_date: week_end)
      end
    end
  end

  desc "Sends mail notification to manager (admin users) each day to inform of pending overtime requests"
  task manager_email: :environment do
    submitted_posts = Post.submitted
    admin_users = AdminUser.all
    
    if submitted_posts.count > 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_now
      end
    end
  end
end
