Rails.application.routes.draw do
  resources :feedbacks
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
  namespace :admin do
    get "feedbacks/search", to: "feedbacks#search", as: "search"
    resources :feedbacks
  end
end
