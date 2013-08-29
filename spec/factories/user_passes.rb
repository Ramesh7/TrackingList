# Read about factories at https://github.com/thoughtbot/factory_girl
require 'digest/sha2'
FactoryGirl.define do
  salt = "536ec686e1a8aa0d5dcb74329fa74dccdffc1f2f89b062ccf6"
  password = 
  factory :user_pass do
    user_id "1234567891"
    current_pass 'testsyne12'
    current_salt salt
    pass1 'testsyne123'
    pass2 'testsyne124'
    pass3 'testsyne125'
  end
end
