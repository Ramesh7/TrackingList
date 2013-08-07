class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users, {:id => false, :primary_key => :user_id} do |t|
      t.integer :user_id
      t.string :user_first_name
      t.string :user_type
      t.string :user_middle_name
      t.string :user_last_name
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
