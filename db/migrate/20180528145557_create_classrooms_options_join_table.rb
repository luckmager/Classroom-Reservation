class CreateClassroomsOptionsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :classrooms, :options do |t|
      t.references :classroom, foreign_key: true
      t.references :option, foreign_key: true
    end
  end
end
