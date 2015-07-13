Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :courses, only: [:index, :show]
  resources :course_registrations, only: [:destroy]

  resources :students, only: [:new, :create] do
    resources :registration_holders, only: [:new, :index, :create]
  end

  resources :students, only: [:index, :show, :destroy]
end
