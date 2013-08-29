require 'spec_helper'

describe UserPass do	
	salt = "536ec686e1a8aa0d5dcb74329fa74dccdffc1f2f89b062ccf6"
	before :each do
		subject { FactoryGirl.create(:user_pass) }
	end

	describe "#create" do
	    context "when save user_pass with sucess" do
	      it { subject.present?.should be_true }
	      it { subject.current_pass.should == Digest::SHA256::hexdigest("--#{salt}--#{'testsyne12'}--") }
	    end
	end

    describe "#update" do
	    let(:user_pass) { FactoryGirl.create(:user_pass) }

	    context "persistence updated object in database" do
	      it { user_pass.save.should be_true }
	      it { user_pass.present?.should be_true }
	      it { user_pass.current_pass.should == Digest::SHA256::hexdigest("--#{salt}--#{'testsyne12'}--") }
	    end
    end    
end
