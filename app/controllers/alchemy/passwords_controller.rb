module Alchemy
  class PasswordsController < ::Devise::PasswordsController
    helper 'Alchemy::Pages'

    private

    def new_session_path(*)
      alchemy.login_path
    end
  end
end
