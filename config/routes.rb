Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users
  resources :contacts, only: %i(index new create destroy)
  resources :chats, only: %w[index show] do
    resources :messages, only: :create, defaults: { format: :js }
  end
end
