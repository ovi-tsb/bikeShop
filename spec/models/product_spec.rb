require 'rails_helper'
  describe Product do 
    
    before do
      @user = FactoryGirl.create(:user)
      @product = FactoryGirl.create(:product)
      #@user = User.create!(first_name: "Gigi", last_name: "Gogo", email: "gigi@yahoo.com", password: "123456")
      #@product = Product.create!(name: "race bike", colour: "red", price: "100", description: "Nice bike", image_url: "C16.jpg" )
      
      @product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
      @product.comments.create!(rating: 3, user: @user, body: "Good bike!")
      @product.comments.create!(rating: 5, user: @user, body: "Best bike!")
    end

    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq(3)  
    end
    
    it "is not valid" do 
      expect(Product.new(description: "Nice bike")).not_to be_valid
    end

    it "is not valid" do 
      expect(Product.new(name: "race bike")).not_to be_valid
    end
  end

  
