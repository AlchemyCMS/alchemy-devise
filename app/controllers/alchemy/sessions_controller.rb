# frozen_string_literal: true

module Alchemy
  class SessionsController < ::Devise::SessionsController
    helper "Alchemy::Pages"

    private

    def after_sign_in_path_for(user)
      stored_location_for(user) || alchemy.account_path
    end
  end
end
