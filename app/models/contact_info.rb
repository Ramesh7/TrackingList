class ContactInfo < ActiveRecord::Base
  self.primary_key = 'user_id'
  attr_accessible :address1, :address2, :contact_no, :user_id
  belongs_to :user
end
	