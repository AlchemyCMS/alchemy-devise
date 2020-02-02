require 'rails_helper'

describe "Login: " do
  context "If user is present" do
    let!(:user) do
      Alchemy::User.create!(
        email: 'admin@example.com',
        password: 's3cr3t',
        password_confirmation: 's3cr3t',
        alchemy_roles: %w[admin]
      )
    end

    let!(:default_key) { Devise.authentication_keys }

    before do
      allow(Alchemy::User).to receive_messages(count: 1)
    end

    it "displays an email authentication field" do
      visit '/admin/login'
      expect(page).to have_field('user_email')
    end

    it "works" do
      visit '/admin/login'
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Login'
      expect(page).to have_content('Welcome back')
    end
  end
end
