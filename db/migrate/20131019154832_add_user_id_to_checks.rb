class AddUserIdToChecks < ActiveRecord::Migration
  def change
    add_column :checks, :user_id, :integer
  end
end
