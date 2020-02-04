module Alchemy
  class AccountsController < ::Devise::RegistrationsController
    helper 'Alchemy::Pages'

    def show
      authorize! :show, current_alchemy_user
      @user = current_alchemy_user
    end

    private

    def permission_denied(*)
      store_location_for(:user, account_path)
      flash[:warning] = t(:unauthenticated, scope: 'devise.failure')
      redirect_to alchemy.login_path
    end
  end
end
