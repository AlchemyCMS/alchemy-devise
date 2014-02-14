authorization do
  role :registered do
    has_permission_on :alchemy_admin_users, :to => [:edit, :update] do
      if_attribute :id => is {user.id}
    end
  end

  role :author do
    includes :registered
    has_permission_on :alchemy_admin_users, :to => [:index]
  end

  role :editor do
    includes :author
  end

  role :admin do
    includes :editor
    has_permission_on :alchemy_admin_users, :to => [:manage, :update_roles]
  end
end

privileges do
  # default privilege hierarchies to facilitate RESTful Rails apps
  privilege :manage,  :includes => [:create, :read, :update, :delete]
  privilege :read,    :includes => [:index, :show]
  privilege :create,  :includes => :new
  privilege :update,  :includes => :edit
  privilege :delete,  :includes => :destroy
end
