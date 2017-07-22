require 'rails_helper'

describe ProductsController, :type => :controller do
    
    # index action
    describe "GET #index" do

      it "populates an array matching the searchparam" do
        superbike = FactoryGirl.create(:product, name: "Superbike")
        badbike = FactoryGirl.create(:product, name: "Badbike")
        get :index, params: {q: "bad"}
        expect(assigns(:products)).to match_array([badbike])
      end

      it "renders the index page" do
        get :index
        expect(response).to be_ok
        expect(response).to render_template("index")
      end
      
    end
    # new action
    describe "GET #new" do
      it "assigns a new Product to @product" do 
        get :new
        expect(assigns(:product)).to be_a_new(Product)
      end

      it "renders the :new template" do 
        get :new
        expect(response).to render_template :new
      end
    end

    describe "POST #create" do

    end
    
    # show action
    describe "GET #show" do 
      before do
        @product = FactoryGirl.create(:product)
      end

      it "Loads a single product page" do
        get :show, params: {id: @product}
        expect(response).to be_ok
        expect(response).to have_http_status(200)
      end
    end
    # create action
    context 'POST #create' do
      it 'is a valid product'do
        @product = FactoryGirl.build(:product)
        expect(@product).to be_valid
      end

      it 'is an invalid product' do
        @product = FactoryGirl.build(:product, name: "")
        expect(@product).not_to be_valid
      end
          
      context "with valid attributes" do
        it "saves the new product in the database" do
          expect{
            post :create, product: FactoryGirl.attributes_for(:product)
          }.to change(Product, :count).by(1)
        end

        it "redirects to products#show" do
          post :create, product: FactoryGirl.attributes_for(:product)
          expect(response).to redirect_to product_path(assigns[:product])
        end
      end
      
      context "with invalid attributes" do
        it "does not save the new product in the database" do
          expect{
            post :create,product: FactoryGirl.attributes_for(:product, name: nil)
          }.not_to change(Product, :count)
        end

        it "re-renders the new: template" do
          post :create, product: FactoryGirl.attributes_for(:product, name: nil)
          expect(response).to render_template :new
        end
      end
    end  
    # update action
    context "POST #update/:price" do
      before do
        @product = FactoryGirl.create(:product)
        @user = FactoryGirl.build(:user)
        sign_in @user
      end
      
      context "valid attributes" do
        it "locates the requested @product" do
          patch :update, params: {id: @product, product: FactoryGirl.attributes_for(:product)}
          expect(assigns(:product)).to eq(@product)
        end

        it "changes @product's attributes" do
          patch :update, params: {id: @product,
                             product: FactoryGirl.attributes_for(:product,
                                name: "Superbike",
                              colour: "white")}
          @product.reload
          expect(@product.name).to eq("Superbike")
          expect(@product.colour).to eq("white")
        end

        it "redirects to the updated contact" do
          patch :update, params: {id: @product, product: FactoryGirl.attributes_for(:product)}
          expect(response).to redirect_to @product
        end
      end
      context "with invalid attributes" do
        it "does not change the product's attributes" do
          patch :update, params: {id: @product, 
                             product: FactoryGirl.attributes_for(:product, name: nil)}
          @product.reload
          expect(@product.name).to eq("Generated bike")
        end

        it "re-renders the :edit template" do
          patch :update, params: {id: @product, product: FactoryGirl.attributes_for(:product, name: nil)}
          expect(response).to render_template :edit
        end
      end
          
    end
    # delete action
    context "DELETE #destroy" do
      before do
        @product = FactoryGirl.create(:product)
        @user = FactoryGirl.create(:user)
        sign_in @user
      end

      it "should allow admin to delete product" do
        expect(delete :destroy, params: {:id => @product} ).to redirect_to(products_url)
      end
    end
end