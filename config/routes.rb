Rails.application.routes.draw do
  root "posts#index"
  devise_for :users,
             :controllers => { :registrations => "my_devise/registrations" }

  resources :courses

  resources :instructors, only: [:index, :create, :edit, :update, :destroy]
  resources :venues, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :students, only: [:index, :update, :edit, :destroy, :new, :create]

  resources :students, only: [:show]
  resources :course_reviews

  resources :posts, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :meeting_dates, only: [:destroy]
  resources :course_registrations, only: [:destroy]

  resources :dojos, only: [:index]
end
