require 'rails_helper'

describe "Admin User Session Routing" do
  routes { Alchemy::Engine.routes }

  it "routes to login" do
    expect({
      get: "/admin/login"
    }).to route_to(
      controller: "alchemy/admin/user_sessions",
      action: "new"
    )
  end

  it "routes to create session" do
    expect({
      post: "/admin/login"
    }).to route_to(
      controller: "alchemy/admin/user_sessions",
      action: "create"
    )
  end

  it "routes to logout" do
    expect({
      delete: "/admin/logout"
    }).to route_to(
      controller: "alchemy/admin/user_sessions",
      action: "destroy"
    )
  end
end
