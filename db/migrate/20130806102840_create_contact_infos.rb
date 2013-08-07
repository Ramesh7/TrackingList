class CreateContactInfos < ActiveRecord::Migration
  def self.up
    create_table :contact_infos, {:id => false} do |t|
      t.belongs_to :user
      t.integer :contact_no
      t.string :address1
      t.string :address2
      t.timestamps
    end
  end

  def self.down
  	drop_table :contact_infos
  end
end
