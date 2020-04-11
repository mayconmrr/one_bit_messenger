Rails.application.routes.draw do
  root to: 'chats#index'

  get "/manifest.json", to: "service_workers#manifest"
  get "/service-worker.js"  => "service_workers#service_worker"

  resources :contacts, only: %i(index new create destroy)

  devise_for :users
  resources :contacts, only: %i(index new create destroy)
  resources :chats, only: %w[index show] do
    resources :messages, only: %i(create), defaults: { format: :js }
  end

  resources :messages, only: %i(update), defaults: { format: :js }
end
