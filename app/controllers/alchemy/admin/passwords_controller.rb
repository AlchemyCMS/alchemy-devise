# frozen_string_literal: true

require "alchemy/version"

module Alchemy
  module Admin
    class PasswordsController < ::Devise::PasswordsController
      include Alchemy::Admin::Locale

      if Alchemy.gem_version <= Gem::Version.new("4.9")
        before_action { enforce_ssl if ssl_required? && !request.ssl? }
      end

      helper "Alchemy::Admin::Base"

      layout "alchemy/admin"

      private

      # Override for Devise method
      def new_session_path(resource_name)
        alchemy.admin_login_path
      end

      def after_resetting_password_path_for(resource)
        alchemy.admin_dashboard_path
      end
    end
  end
end
