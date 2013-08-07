class CreateUserPasses < ActiveRecord::Migration
  def self.up
    create_table :user_passes, {:id => false}  do |t|
      t.belongs_to :user
      t.string :current_pass
      t.string :current_salt
      t.string :pass1
      t.string :pass2
      t.string :pass3
      t.timestamps
    end
  end

  def self.down
    drop_table :user_passes
  end
end
