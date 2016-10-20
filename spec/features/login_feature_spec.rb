require 'spec_helper'

describe "Login: " do
  context "If users present" do
    let!(:default_key) { Devise.authentication_keys }
    let!(:user) { create(:alchemy_admin_user) }

    context "with Alchemy configuration" do
      it "displays an login authentication field" do
        visit '/admin/login'
        expect(page).to have_field('user_login')
      end
    end

    context "with default Devise configuration" do
      before do
        Devise.authentication_keys = [:email]
      end

      it "displays an email authentication field" do
        visit '/admin/login'
        expect(page).to have_field('user_email')
      end

      after do
        Devise.authentication_keys = default_key
      end
    end

    context "when the user signs in for the first time" do
      before do
        user.update_column(:sign_in_count, 0)
      end

      context "when the password has never changed before" do
        before do
          user.update_column(:password_changed_at, nil)
        end

        it 'requests a password reset', :aggregate_failures do
          visit '/admin/login'

          fill_in 'user_login', with: user.login
          fill_in 'user_password', with: user.password
          click_button 'login'

          expect(page).to have_content(Alchemy.t(:reset_password_after_first_login))
          expect(page).to have_field('user_password_confirmation')
        end
      end
    end
  end
end
