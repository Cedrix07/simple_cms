class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string "first_name", :limit => 25
      t.string "last_name", :limit=> 50
      t.string "email", :default => "", :null => false
      t.string "password", :limit=>50
      t.timestamps
    end
  end
end
