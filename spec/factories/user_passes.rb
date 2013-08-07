# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  salt = "536ec686e1a8aa0d5dcb74329fa74dccdffc1f2f89b062ccf6"
  factory :user_pass do
    user_id "1234567891"
    current_pass Digest::SHA256.hexdigest("--#{salt}--#{testsyne12}--")
    current_salt salt
    pass1 Digest::SHA256.hexdigest("--#{salt}--#{testsyne122}--")
    pass2 Digest::SHA256.hexdigest("--#{salt}--#{testsyne123}--")
    pass3 Digest::SHA256.hexdigest("--#{salt}--#{testsyne124}--")
  end
end
