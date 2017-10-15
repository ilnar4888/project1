Rails.application.routes.draw do
  resources :feedbacks
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
  namespace :admin do
    resources :feedbacks
  end
end
