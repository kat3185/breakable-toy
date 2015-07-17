Rails.application.routes.draw do
  root "posts#index"
  devise_for :users,
             :controllers => { :registrations => "my_devise/registrations" }

  resources :courses
  resources :course_registrations, only: [:destroy]
  resources :instructors, only: [:index, :create, :edit, :update, :destroy]
  resources :venues, only: [:index, :new, :create, :edit, :update, :destroy]

  resources :students, only: [:new, :create] do
    resources :registration_holders, only: [:new, :index, :create]
  end

  resources :students, only: [:show] do
    resources :course_registrations, only: [:create]
  end

  resources :students, only: [:index, :update, :edit, :destroy]
  resources :posts, only: [:index, :new, :create, :edit, :update, :destroy]

  get "dojo", to: "dojos#index"
end
