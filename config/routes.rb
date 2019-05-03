Rails.application.routes.draw do
  # Sessions
  resources :user_sessions, only: [:create]
  get "login" => "user_sessions#new", :as => :login
  delete "logout" => "user_sessions#destroy", :as => :logout

  # Admin
  namespace :admin do
    resources :users
    resources :posts
    resources :events
    resources :wards
    resources :map_layers
    resources :map_feedbacks
    resources :contact_submissions
    resources :councillors
    root to: "users#index"
  end

  # Public routes
  get "about" => "page#about", as: :about
  get "activities" => "events#index", as: :activities
  get "wards/:slug" => "wards#show", as: :ward
  post "map_feedback" => "map_feedback#create", as: :submit_map_feedback
  get "contact" => "contact_submissions#new", as: :contact
  post "contact" => "contact_submissions#create", as: :contact_submissions
  get "bike" => "page#bike", as: :bike
  resources :posts, only: [:show]
  root to: "page#home"
end
