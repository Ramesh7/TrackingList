# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    user_id "1234567891"
    user_first_name "Ramesh"
    user_type "0"
    user_middle_name "Prasad"
    user_last_name "ManojR"
    email 'manoj.prasad@sencha.com'
    password 'testsyne12'
    password_confirmation 'testsyne12'
    contact_no 1234567891
  end
end
