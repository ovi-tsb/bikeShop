require 'rails_helper'
  describe User do 
    
    before do
      @user = User.create!(first_name: "Gigi", last_name: "Gogo", email: "gigi@yahoo.com", password: "123456")
    end
    
    it "is not valid" do 
      expect(User.new(email: "")).not_to be_valid
    end

    
  end