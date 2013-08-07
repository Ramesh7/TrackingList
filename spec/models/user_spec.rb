require 'spec_helper'

describe User do
  before :each do
    @user = FactoryGirl.build(:user) 
  end

	it { should respond_to(:email) }
	it { should respond_to(:user_first_name) }
	it { should respond_to(:user_middle_name) }
	it { should respond_to(:user_last_name) }
	it { should respond_to(:user_id) }

	it "can be instantiated" do
    	@user.should be_an_instance_of(User)
  	end

  	it "can be saved successfully" do
  		@user = FactoryGirl.create(:user, user_first_name: "hencha", user_middle_name: "ramram", user_last_name: "lastbarnamadal", email: "hi@xmaple.com", password: 'testsyne12', password_confirmation: 'testsyne12', contact_no: 1234567891)
    	@user.should be_persisted
    	@user.should be_valid
	end

    it "should create a new instance given a valid attribute" do
    	@user = FactoryGirl.create(:user, user_first_name: "hencha", user_middle_name: "ramram", user_last_name: "lastbarnamadal", email: "hi@xmaple.com", password: 'testsyne12', password_confirmation: 'testsyne12', contact_no: 1234567891)
	    @user.save
	    @user.should be_valid
  	end


	it "get_user" do
	    FactoryGirl.create(:user, user_first_name: "hencha", user_middle_name: "ramram", user_last_name: "lastbarnamadal", email: "hi@xmaple.com", password: 'testsyne12', password_confirmation: 'testsyne12', contact_no: 1234567891)
	    email_id = 'hi@xmaple.com'
	    user = User.get_user(email_id).first.present?
	    user.should == true
	end

	describe 'get_user' do
	 	email_id = 'hi@xmaple.com'
	 	it 'get_user if present ' do
	 		FactoryGirl.create(:user, user_first_name: "hencha", user_middle_name: "ramram", user_last_name: "lastbarnamadal", email: "hi@xmaple.com", password: 'testsyne12', password_confirmation: 'testsyne12', contact_no: 1234567891)
	 		user = User.get_user(email_id).first.present?
	 		user.should == true	
	 	end
	 	it 'get_user if not present' do
	 		@user = User.get_user(email_id).first.present?
	 		@user.should == false
	 	end
	end

	it "should require an email address" do
	    @user.update_attributes({:email => nil})
	    @user.should_not be_valid
	    @user.errors[:email] = ["can't be blank"]
  	end

	it 'should require a first_name' do
	    @user.update_attributes({:user_first_name => nil })
	    @user.should_not be_valid
	    @user.errors[:user_first_name] = ["can't be blank"]
  	end

    it "should accept valid email addresses" do
    	@user = FactoryGirl.create(:user, user_first_name: "hencha", user_middle_name: "ramram", user_last_name: "lastbarnamadal", email: "hi@xmaple.com", password: 'testsyne12', password_confirmation: 'testsyne12', contact_no: 1234567891)
	    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
	    addresses.each do |address|
	      @user.update_attributes({:email => address})
	      @user.should be_valid
	    end
  	end

    it "should reject invalid email addresses" do
    	@user = FactoryGirl.create(:user, user_first_name: "hencha", user_middle_name: "ramram", user_last_name: "lastbarnamadal", email: "hi@xmaple.com", password: 'testsyne12', password_confirmation: 'testsyne12', contact_no: 1234567891)
	    addresses = %w[user@foo,com THE_USER.foo.bar.org first@last@foo.jp]
	    addresses.each do |address|
	      @user.update_attributes({:email => address})
	      @user.should_not be_valid
	      @user.errors[:email] = ["is invalid"]
	    end
    end

    it "should reject duplicate email address" do
    	@user.save
	    @user.should be_valid
	    @duplicate_user = FactoryGirl.build(:user)
	    @duplicate_user.update_attributes({:user_first_name => "Duplicate"})
	    @duplicate_user.save
	    @duplicate_user.should_not be_valid
	    @duplicate_user.errors[:email] = ["already been taken"]
  	end

    it "should reject email address identical up to case" do
	    @user.save
	    @user.should be_valid
	    @duplicate_user = FactoryGirl.build(:user)
	    uppercase_email = @duplicate_user.email.upcase
	    @duplicate_user.update_attributes({:email => uppercase_email})
	    @duplicate_user.should_not be_valid
	    @duplicate_user.errors[:email] = ["already been taken"]
  	end
end
