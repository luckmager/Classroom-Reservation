class ChangeFromAndToInReservation < ActiveRecord::Migration[5.1]
  def change
    rename_column :reservations, :from, :from_block
    rename_column :reservations, :to, :to_block
  end
end
