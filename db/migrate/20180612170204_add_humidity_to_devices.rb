class AddHumidityToDevices < ActiveRecord::Migration[5.1]
  def change
    change_column :devices, :temperature, :string
    add_column :devices, :humidity, :string
  end
end
