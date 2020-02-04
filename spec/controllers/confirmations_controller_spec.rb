require 'rails_helper'

describe Alchemy::ConfirmationsController do
  routes { Alchemy::Engine.routes }

  context 'with user accounts enabled' do
    before do
      allow(Alchemy::Devise).to receive(:enable_user_accounts?) { true }
    end

    context 'with confirmations enabled' do
      let(:user) { double(email: 'mail@example.com') }

      before do
        allow(Alchemy::Devise).to receive(:confirmations_enabled?) { true }
        Rails.application.reload_routes!
        @request.env["devise.mapping"] = Devise.mappings[:user]
        expect(Alchemy::User).to receive(:send_confirmation_instructions) { user }
      end

      describe '#create' do
        context 'with valid params' do
          before do
            expect(user).to receive(:errors) { [] }
          end

          it "redirects to account" do
            post :create, params: {user: {email: user.email}}
            expect(response).to redirect_to(login_path)
          end
        end

        context 'without valid params' do
          before do
            expect(user).to receive(:errors).twice { ['Email not found'] }
          end

          it "renders form" do
            post :create, params: {user: {email: 'not@found'}}
            is_expected.to render_template(:new)
          end
        end
      end
    end
  end
end
