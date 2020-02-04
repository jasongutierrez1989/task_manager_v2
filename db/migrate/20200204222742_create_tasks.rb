class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.integer :user_id
      t.integer :location_id

      t.timestamps
    end
  end
end
