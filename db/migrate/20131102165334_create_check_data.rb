class CreateCheckData < ActiveRecord::Migration
  def change
    create_table :check_data do |t|
      t.datetime :date_checked
      t.integer :check_id
      t.text :status
      t.integer :response_time

      t.timestamps
    end
  end
end
