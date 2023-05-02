Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    resources :customers, only: [:index, :create, :show, :edit, :update]
    resources :submissions, only: [:index, :new, :create, :show, :edit, :update]
    resources :reviews, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :favorites, only: [:index, :new, :create, :show, :edit, :update]
    root to: "homes#top"
  end
  
  #homes
  root to: "public/homes#top"
  get "/about" => "public/homes#about"
  
  #submissions
  get "/submissions/new" => "public/submissions#new", as: "new_submission"
  get "/submissions" => "public/submissions#index", as: "index_submission"
  get "/submissions/:id" => "public/submissions#show", as: "show_submission"
  get "/submissions/:id/edit" => "public/submissions#edit", as: "edit_submission"
  post "/submissions" => "public/submissions#create", as: "create_submission"
  patch "/submissions/:id" => "public/submissions#update", as: "update_submission"
  delete "/submissions/:id" => "public/submissions#destroy", as: "destroy_submission"
  
  #reviews
  
  #genres
  
  #favorites
end
