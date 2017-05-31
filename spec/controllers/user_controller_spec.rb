require 'rails_helper'

describe UsersController, type: :controller do
  before do
    @user  = User.create!(email: 'toto@example.com', password: '123456', first_name: 'toto', last_name: 'titi') 
    @user2 = User.create!(email: 'gigi@example.com', password: '123456', first_name: 'gogo', last_name: 'gigi') 
  end
  describe 'GET #show' do
       context 'User is logged in' do
          before do
            sign_in @user
          end
          it "Loads correct user details" do
            get :show, params: { id: @user.id }
            expect(response).to have_http_status(200)
            expect(assigns(:user)).to eq @user
          end
       end

       context 'No user is logged in' do
         it 'redirects to login' do
           get :show, params: { id: @user.id }
           expect(response).to redirect_to(new_user_session_path)
         end
       end

       context 'User cannot see other user page' do
        before do
          sign_in @user2
        end
        it "redirect to root path" do
          get :show, params: { id: @user.id }
          expect(response).to redirect_to(root_path)
        end
       end
    end


end

