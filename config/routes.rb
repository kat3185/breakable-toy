Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users,
             :controllers => { :registrations => "my_devise/registrations" }

  resources :courses
  resources :course_registrations, only: [:destroy]
  resources :instructors, only: [:index, :create, :edit, :update, :destroy]
  resources :venues, only: [:index, :new, :create, :edit, :update]

  resources :students, only: [:new, :create] do
    resources :registration_holders, only: [:new, :index, :create]
  end

  resources :students, only: [:index, :show, :destroy]

  get "dojo", to: "dojos#index"
end
