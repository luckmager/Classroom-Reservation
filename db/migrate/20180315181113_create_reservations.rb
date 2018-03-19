class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
	t.string :title
	t.string :description
	t.datetime :from
	t.datetime :to
	t.belongs_to :user
	t.timestamps
    end
  end
end
