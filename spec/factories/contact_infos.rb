# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact_info do
    user_id "1234567891"
    contact_no "1234567891"
    address1 "test1"
    address2 "test2"
  end
end
