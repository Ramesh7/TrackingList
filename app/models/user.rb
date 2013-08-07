class User < ActiveRecord::Base
  self.primary_key = 'user_id'
  attr_accessible :user_first_name, :user_id, :user_last_name, :user_middle_name, :user_type, :password, :password_confirmation, :contact_no, :address1, :address2, :email
  attr_accessor :password, :password_confirmation, :contact_no, :address1, :address2
  
  has_one :user_pass, dependent: :destroy
  has_one :contact_info, dependent: :destroy
  
  validates :user_first_name, presence: true, length: {:within => 6..20}
  validates :user_last_name, length: {:within => 6..20}, allow_blank: true
  validates :user_middle_name, length: {:within => 6..20}, allow_blank: true
  validates :email, presence: true, format: { with: /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9]+\.[a-zA-Z0-9.]+$/ }
  validates :email, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {:within => 8..30}, format: { with: /^[a-zA-Z]+[0-9]+[a-zA-Z0-9]*$|^[0-9]+[a-zA-Z]+[a-zA-Z0-9]*$/ }
  validates :password, confirmation: true
  validates :contact_no, presence: true, format: { with: /^[0-9]{10}$/ }

  scope :get_user, lambda{|email_id| where(email: email_id) }
end
