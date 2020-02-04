require 'rails_helper'

describe Alchemy::AccountsController do
  routes { Alchemy::Engine.routes }

  context 'with user accounts enabled' do
    before do
      allow(Alchemy::Devise).to receive(:enable_user_accounts?) { true }
      Rails.application.reload_routes!
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end

    describe '#show' do
      let(:user) { create(:alchemy_member_user) }

      context 'with authorized user' do
        before { authorize_user(user) }

        render_views

        it 'shows account' do
          get :show
          is_expected.to render_template(:show)
        end
      end

      context 'with unauthorized user' do
        it 'redirects to login' do
          get :show
          is_expected.to redirect_to(login_path)
        end

        it 'stores current location' do
          get :show
          expect(session[:user_return_to]).to eq(account_path)
        end

        it 'shows warning message' do
          get :show
          expect(flash[:warning]).to eq I18n.t(:unauthenticated, scope: 'devise.failure')
        end
      end
    end
  end
end
