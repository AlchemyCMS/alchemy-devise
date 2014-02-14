require 'alchemy_cms'
require 'devise'

module Alchemy
  module Devise
    class Engine < ::Rails::Engine
      isolate_namespace Alchemy
      engine_name 'alchemy_devise'

      initializer "alchemy_devise.add_authorization_rules" do
        rules = File.join(File.dirname(__FILE__), '../../..', 'config/authorization_rules.rb')
        Alchemy::Auth::Engine.get_instance.load(rules)
      end

      config.to_prepare do
        require_relative '../../../app/controllers/alchemy/base_controller_extension.rb'
      end
    end
  end
end
