class CreateClassrooms < ActiveRecord::Migration[5.1]
  def change
    create_table :classrooms do |t|
      t.string :name
      t.integer :max_persons
	    t.references :building, index: true, foreign_key: true
      t.timestamps
    end
  end
end
