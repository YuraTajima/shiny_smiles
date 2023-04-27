Rails.application.routes.draw do
  namespace :admin do
    get 'favorites/index'
    get 'favorites/show'
    get 'favorites/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/show'
    get 'genres/edit'
    get 'genres/new'
  end
  namespace :admin do
    get 'reviews/index'
    get 'reviews/show'
    get 'reviews/edit'
  end
  namespace :admin do
    get 'submissions/index'
    get 'submissions/show'
    get 'submissions/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :public do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
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
    root to: "homes#top"
  end
  
  #homes
  root to: "public/homes#top"
  get "/about" => "public/homes#about"
  
  #submissions
  get "/submissions/new" => "public/submissions#new", as: "new_submission"
  post "/submissions" => "public/submissions#create", as: "create_submission"
  get "/submissions" => "public/submissions#index", as: "index_submission"
  get "/submissions/:id" => "public/submissions#show", as: "show_submission"
  get "/submissions/:id/edit" => "public/submissions#edit", as: "edit_submission"
  patch "/submissions/:id" => "public/submissions#update", as: "update_submission"
  
  
  #reviews
  
  #genres
  
  #favorites
end
