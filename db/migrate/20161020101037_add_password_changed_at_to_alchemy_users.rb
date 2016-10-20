class AddPasswordChangedAtToAlchemyUsers < ActiveRecord::Migration
  def change
    add_column :alchemy_users, :password_changed_at, :timestamp
  end
end
