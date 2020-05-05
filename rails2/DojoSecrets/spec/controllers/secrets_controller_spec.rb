require 'rails_helper'
RSpec.describe SecretsController, type: :controller do
    before do
        @user = create(:user)
        @secret = create(:secret, user: @user)
    end
    context "when not logged in" do
        before do
            session[:user_id] = nil
        end
        it "cannot access index" do
            get :index
            expect(response).to redirect_to("/sessions/new")
        end
        it "cannot access create" do
            post :create, params: {name: "Oscar Vazquez",
            email: "oscar@gmail.com",
            password: "password",
            password_confirmation: "password"}
            expect(response).to redirect_to("/sessions/new")
        end
        it "cannot access destroy" do
            delete :destroy, user_id: @user.id, id: @secret.id
            expect(response).to redirect_to("/sessions/new")
        end
    end
end