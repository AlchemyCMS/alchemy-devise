# frozen_string_literal: true

require "rails_helper"

describe "Password Routing" do
  context "if user accounts are enabled" do
    before(:all) do
      Alchemy::Devise.enable_user_accounts = true
      Rails.application.reload_routes!
    end

    it "routes to new password" do
      expect({
        get: "/account/password/new",
      }).to route_to(
        controller: "alchemy/passwords",
        action: "new",
      )
    end

    it "routes to reset password" do
      expect({
        post: "/account/password",
      }).to route_to(
        controller: "alchemy/passwords",
        action: "create",
      )
    end

    it "routes to edit password" do
      expect({
        get: "/account/password/edit",
      }).to route_to(
        controller: "alchemy/passwords",
        action: "edit",
      )
    end

    it "routes to update password" do
      expect({
        patch: "/account/password",
      }).to route_to(
        controller: "alchemy/passwords",
        action: "update",
      )
    end
  end

  context "if user accounts are disabled" do
    before(:all) do
      Alchemy::Devise.enable_user_accounts = false
      Rails.application.reload_routes!
    end

    it "does not route to new password" do
      expect({
        get: "/account/password/new",
      }).to_not route_to(
        controller: "alchemy/passwords",
        action: "new",
      )
    end

    it "does not route to reset password" do
      expect({
        post: "/account/password",
      }).to_not route_to(
        controller: "alchemy/passwords",
        action: "create",
      )
    end

    it "does not route to edit password" do
      expect({
        get: "/account/password/edit",
      }).to_not route_to(
        controller: "alchemy/passwords",
        action: "edit",
      )
    end

    it "does not route to update password" do
      expect({
        patch: "/account/password",
      }).to_not route_to(
        controller: "alchemy/passwords",
        action: "update",
      )
    end
  end
end
