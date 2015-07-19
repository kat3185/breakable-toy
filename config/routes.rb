Rails.application.routes.draw do
  root "posts#index"
  devise_for :users,
             :controllers => { :registrations => "my_devise/registrations" }

  resources :courses
  resources :course_registrations, only: [:destroy]
  resources :instructors, only: [:index, :create, :edit, :update, :destroy]
  resources :venues, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :students, only: [:index, :update, :edit, :destroy, :new, :create]
  
  resources :students, only: [:show] do
    resources :course_registrations, only: [:create]
  end
  resources :course_reviews

  resources :posts, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :meeting_dates, only: [:destroy]

  get "dojo", to: "dojos#index"
end
