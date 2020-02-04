require 'rails_helper'

describe Alchemy::SessionsController do
  routes { Alchemy::Engine.routes }

  context 'with user accounts enabled' do
    before(:all) do
      Alchemy::Devise.enable_user_accounts = true
      Rails.application.reload_routes!
    end

    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end

    let(:user) { create(:alchemy_user) }

    describe '#create' do
      context 'with valid user' do
        let(:user_params) do
          {
            login: user.login,
            password: 's3cr3t'
          }
        end

        before { user }

        context 'without redirect path in session' do
          it "redirects to account" do
            post :create, params: {user: user_params}
            expect(response).to redirect_to(account_path)
          end
        end

        context 'with redirect path in session' do
          it "redirects to these params" do
            session[:user_return_to] = '/secret_page'
            post :create, params: {user: user_params}
            expect(response).to redirect_to('/secret_page')
          end
        end

        context 'without valid params' do
          it "renders login form" do
            post :create, params: {user: {login: ''}}
            is_expected.to render_template(:new)
          end
        end
      end
    end

    describe "#destroy" do
      before do
        authorize_user(user)
      end

      it "redirects to root" do
        delete :destroy
        is_expected.to redirect_to(root_path)
      end
    end
  end
end
