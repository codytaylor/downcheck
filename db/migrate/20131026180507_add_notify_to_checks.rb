class AddNotifyToChecks < ActiveRecord::Migration
  def change
    add_column :checks, :notify, :integer
  end
end
