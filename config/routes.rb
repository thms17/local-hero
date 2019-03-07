Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  authenticated :user do
    root to: 'feeds#index'
  end

  root to: 'pages#home'
  resources :feeds, path: :feed, only: [:index]
  resources :tasks, only: [:new, :create, :show, :index]
  resources :questions, only: [:new, :create, :show, :index]
  resources :events, only: [:new, :create, :show, :index] do
    resources :attendances, only: [:create]
  end

  resources :attendances, only: [:destroy]
end
