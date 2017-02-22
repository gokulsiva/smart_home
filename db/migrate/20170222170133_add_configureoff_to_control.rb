class AddConfigureoffToControl < ActiveRecord::Migration[5.0]
  def change
    add_column :controls, :configureoff, :time, :default => Time.now.utc
    change_column :controls, :configure, :time, :default => Time.now.utc
  end
end
