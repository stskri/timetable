class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.integer :schedule_id, null: false
      t.integer :subject_id, null: false
      t.integer :day_of_week, null: false # enum
      t.integer :period, null: false
      t.string :teacher_name
      t.time :start_time
      t.time :end_time
      t.string :room_name

      t.timestamps
    end
  end
end
