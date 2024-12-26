class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|

      t.string :name, null: false
      t.string :color, null: false

      t.timestamps
    end
    add_index :subjects, [:name, :color], unique: true
  end
end
