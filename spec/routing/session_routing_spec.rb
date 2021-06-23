# frozen_string_literal: true

require "rails_helper"

describe "Session Routing" do
  context "if user accounts are enabled" do
    before(:all) do
      Alchemy::Devise.enable_user_accounts = true
      Rails.application.reload_routes!
    end

    it "routes to login" do
      expect({
        get: "/account/login",
      }).to route_to(
        controller: "alchemy/sessions",
        action: "new",
      )
    end

    it "routes to create session" do
      expect({
        post: "/account/login",
      }).to route_to(
        controller: "alchemy/sessions",
        action: "create",
      )
    end

    it "routes to logout" do
      expect({
        delete: "/account/logout",
      }).to route_to(
        controller: "alchemy/sessions",
        action: "destroy",
      )
    end
  end

  context "if user accounts are disabled" do
    before(:all) do
      Alchemy::Devise.enable_user_accounts = false
      Rails.application.reload_routes!
    end

    it "does not route to login" do
      expect({
        get: "/account/login",
      }).to_not route_to(
        controller: "alchemy/sessions",
        action: "new",
      )
    end

    it "does not route to create session" do
      expect({
        post: "/account/login",
      }).to_not route_to(
        controller: "alchemy/sessions",
        action: "create",
      )
    end

    it "does not route to logout" do
      expect({
        delete: "/account/logout",
      }).to_not route_to(
        controller: "alchemy/sessions",
        action: "destroy",
      )
    end
  end
end
