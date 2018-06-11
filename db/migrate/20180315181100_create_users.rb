class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
	t.string :first_name
	t.string :last_name
	t.string :username, unique: true
	t.string :password
	t.integer :role, default: 0
	t.text :tokens
	t.timestamps
    end
  end
end
