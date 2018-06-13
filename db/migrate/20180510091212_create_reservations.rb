class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
	  t.date :date
      t.string :title
      t.string :description
      t.integer :from
      t.integer :to
	    t.belongs_to :user
	    t.belongs_to :classroom
      t.timestamps
    end
  end
end
