require 'digest/sha2'
class UserPass < ActiveRecord::Base
  self.primary_key = 'user_id'
  attr_accessible :current_pass, :current_salt, :pass1, :pass2, :pass3, :user_id, :password
  attr_accessor :password
  belongs_to :user
  before_create :generate_password_salt
  
  def generate_password_salt
  	self.updated_at = Time.now 
    generate_salt
    encrypt
  end

  def encrypt
    self.current_pass = Digest::SHA256.hexdigest("--#{self.current_salt}--#{self.password}--")
  end
  
  def generate_salt
    self.current_salt = Digest::SHA256.hexdigest("--#{self.updated_at.to_s}--#{self.user_id.to_s}--")
  end

  def encrypt_current_pass(password)
    Digest::SHA256.hexdigest("--#{self.current_salt}--#{password}--")
  end

  def authenticate_user(password)
    encrypt_pass = encrypt_current_pass(password)
    encrypt_pass.eql?(self.current_pass) ? true : false
  end

end
