class AddUsersToPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :users, foreign_key: true
  end
end
