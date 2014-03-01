class AddActiveToChecks < ActiveRecord::Migration
  def change
    add_column :checks, :active, :integer
  end
end
