# frozen_string_literal: true

require "rails_helper"

describe "Account Routing" do
  context "if user accounts are enabled" do
    before(:all) do
      Alchemy::Devise.enable_user_accounts = true
      Rails.application.reload_routes!
    end

    it "routes to show account" do
      expect({
        get: "/account",
      }).to route_to(
        controller: "alchemy/accounts",
        action: "show",
      )
    end

    it "routes to edit account" do
      expect({
        get: "/account/edit",
      }).to route_to(
        controller: "alchemy/accounts",
        action: "edit",
      )
    end

    it "routes to update account" do
      expect({
        patch: "/account",
      }).to route_to(
        controller: "alchemy/accounts",
        action: "update",
      )
    end

    it "routes to destroy account" do
      expect({
        delete: "/account",
      }).to route_to(
        controller: "alchemy/accounts",
        action: "destroy",
      )
    end

    context "when registrations are enabled" do
      before do
        allow(Alchemy::Devise).to receive(:registrations_enabled?) { true }
        Rails.application.reload_routes!
      end

      it "routes to new account" do
        expect({
          get: "/account/new",
        }).to route_to(
          controller: "alchemy/accounts",
          action: "new",
        )
      end

      it "routes to create account" do
        expect({
          post: "/account",
        }).to route_to(
          controller: "alchemy/accounts",
          action: "create",
        )
      end
    end
  end

  context "if user accounts are disabled" do
    before(:all) do
      Alchemy::Devise.enable_user_accounts = false
      Rails.application.reload_routes!
    end

    it "does not route to show account" do
      expect({
        get: "/account",
      }).to_not route_to(
        controller: "alchemy/accounts",
        action: "show",
      )
    end

    it "does not route to edit account" do
      expect({
        get: "/account/edit",
      }).to_not route_to(
        controller: "alchemy/accounts",
        action: "edit",
      )
    end

    it "does not route to update account" do
      expect({
        patch: "/account",
      }).to_not route_to(
        controller: "alchemy/accounts",
        action: "update",
      )
    end

    it "does not route to destroy account" do
      expect({
        delete: "/account",
      }).to_not route_to(
        controller: "alchemy/accounts",
        action: "destroy",
      )
    end

    it "does not route to new account" do
      expect({
        get: "/account/new",
      }).to_not route_to(
        controller: "alchemy/accounts",
        action: "new",
      )
    end

    it "does not route to create account" do
      expect({
        post: "/account",
      }).to_not route_to(
        controller: "alchemy/accounts",
        action: "create",
      )
    end
  end
end
