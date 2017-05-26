require 'rails_helper'
  describe Comment do 
    
    before do
      @user = User.create!(first_name: "Gigi", last_name: "Gogo", email: "gigi@yahoo.com", password: "123456")
      @product = Product.create!(name: "race bike", colour: "red", price: "100", description: "Nice bike", image_url: "C16.jpg" )
      @product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
    end

    it "is not valid" do 
      expect(@product.comments.new(body: "Awful bike!")).not_to be_valid
    end

  end