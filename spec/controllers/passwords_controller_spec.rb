require 'rails_helper'

describe Alchemy::PasswordsController do
  routes { Alchemy::Engine.routes }

  context 'with user accounts enabled' do
    before(:all) do
      Alchemy::Devise.enable_user_accounts = true
      Rails.application.reload_routes!
    end

    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end

    let!(:user) { create(:alchemy_user) }

    describe '#create' do
      context 'with valid params' do
        it "redirects to login" do
          post :create, params: {user: {email: user.email}}
          expect(response).to redirect_to(login_path)
        end
      end

      context 'without valid params' do
        it "renders form" do
          post :create, params: {user: {email: 'not@found'}}
          is_expected.to render_template(:new)
        end
      end
    end
  end
end
