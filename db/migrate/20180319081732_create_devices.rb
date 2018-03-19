class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :auth
      t.integer :temperature
	  t.references :classroom, index: true, foreign_key: true
      t.timestamps
    end
  end
end
