require 'rails_helper'

describe "Admin Password Routing" do
  routes { Alchemy::Engine.routes }

  it "routes to new password" do
    expect({
      get: "/admin/passwords"
    }).to route_to(
      controller: "alchemy/admin/passwords",
      action: "new"
    )
  end

  it "routes to reset password" do
    expect({
      post: "/admin/passwords"
    }).to route_to(
      controller: "alchemy/admin/passwords",
      action: "create"
    )
  end

  it "routes to edit password" do
    expect({
      get: "/admin/passwords/123/edit/12345"
    }).to route_to(
      controller: "alchemy/admin/passwords",
      action: "edit",
      id: "123",
      reset_password_token: "12345"
    )
  end

  it "routes to update password" do
    expect({
      patch: "/admin/passwords"
    }).to route_to(
      controller: "alchemy/admin/passwords",
      action: "update"
    )
  end
end
