Rails.application.routes.draw do
  devise_for :users, path: "", path_names: {
    sign_in: "login",
    sign_out: "logout",
    registration: "signup"
  }, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  post "sign_in", to: "sessions#create"
  post "sign_up", to: "registrations#create"
  resources :sessions, only: [ :index, :show, :destroy ]
  resource  :password, only: [ :edit, :update ]
  namespace :identity do
    resource :email,              only: [ :edit, :update ]
    resource :email_verification, only: [ :show, :create ]
    resource :password_reset,     only: [ :new, :edit, :create, :update ]
  end
  resources :company_profiles
  resources :user_profiles
  resource :session
  resources :passwords, param: :token
  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"
  resources :companies
  resources :skills
  resources :jobs
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # API documentation routing
  namespace :api do
    resources :jobs, :jobs, only: %i[index show create]
    namespace :v1 do
      defaults format: :json do
        get "home/index", to: "home#index"
      end
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
