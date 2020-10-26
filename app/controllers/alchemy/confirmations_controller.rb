# frozen_string_literal: true

module Alchemy
  class ConfirmationsController < ::Devise::ConfirmationsController
    helper "Alchemy::Pages"

    private

    def new_session_path(*)
      alchemy.login_path
    end
  end
end
