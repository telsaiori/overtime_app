class PostPolicy < ApplicationPolicy

  def update?
    record.user_id == user.id || admin_types.inclued?(user.type)
  end

end