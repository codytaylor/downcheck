class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.belongs_to :site
      t.text :name
      t.text :url
      t.integer :immediate
      t.date :start_date
      t.integer :minute
      t.integer :hour
      t.integer :day_of_month
      t.integer :month
      t.integer :day_of_week
      t.integer :check_type

      t.timestamps
    end
  end
end
