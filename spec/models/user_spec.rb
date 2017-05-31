require 'rails_helper'
  describe User do 
    
    before do
      @user = FactoryGirl.create(:user)
    end
    
    it "is not valid" do 
      expect(User.new(email: "")).not_to be_valid
    end

    
  end