class CreateControls < ActiveRecord::Migration[5.0]
  def change
    create_table :controls do |t|
      t.string :name
      t.integer :pin
      t.time :configure
      t.boolean :automated, :default => false;

      t.timestamps
    end
  end
end
