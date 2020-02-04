Alchemy::Engine.routes.draw do
  if Alchemy::Devise.enable_user_accounts?
    devise_for :user,
      class_name: 'Alchemy::User',
      singular: :user,
      skip: :all,
      controllers: {
        registrations: Alchemy::Devise.registrations_enabled? ? 'alchemy/accounts' : nil,
        confirmations: Alchemy::Devise.confirmations_enabled? ? 'alchemy/confirmations' : nil,
        sessions: 'alchemy/sessions',
        passwords: 'alchemy/passwords'
      },
      path: :account,
      router_name: :alchemy

    scope :account do
      devise_scope :user do
        get '/login' => 'sessions#new'
        post '/login' => 'sessions#create'
        match '/logout' => 'sessions#destroy', via: Devise.sign_out_via

        if Alchemy::Devise.confirmations_enabled?
          resource :confirmation, only: %i[new create show]
        end
        resource :password, only: %i[new create edit update]
      end
    end

    devise_scope :user do
      resource :account, except: Alchemy::Devise.registrations_enabled? ? [] : %i[new create]
    end
  end

  namespace :admin, {
    path: Alchemy.admin_path,
    constraints: Alchemy.admin_constraints
  } do

    devise_for :user,
      class_name: 'Alchemy::User',
      singular: :user,
      skip: :all,
      controllers: {
        sessions: 'alchemy/admin/user_sessions',
        passwords: 'alchemy/admin/passwords'
      },
      router_name: :alchemy

    devise_scope :user do
      get '/dashboard' => 'dashboard#index',
        :as => :user_root
      get '/signup' => 'users#signup',
        :as => :signup
      get '/login' => 'user_sessions#new',
        :as => :login
      post '/login' => 'user_sessions#create'
      match '/logout' => 'user_sessions#destroy',
        :as => :logout, via: Devise.sign_out_via

      get '/passwords' => 'passwords#new',
        :as => :new_password
      get '/passwords/:id/edit/:reset_password_token' => 'passwords#edit',
        :as => :edit_password
      post '/passwords' => 'passwords#create',
        :as => :reset_password
      patch '/passwords' => 'passwords#update',
        :as => :update_password
    end

    resources :users
  end
end
