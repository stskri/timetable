class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|

      t.integer :user_id, null: false
      t.string :name, null: false
      t.string :explanation

      t.timestamps
    end
  end
end
