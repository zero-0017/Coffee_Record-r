Rails.application.routes.draw do

  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'tags/index'
    get 'tags/edit'
  end
# 会員用
devise_for :user,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

scope module: :public do
  root to: 'homes#top'
  get '/about' => 'homes#about'
  resources :post_coffees, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :coffee_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update] do
        member do
    get :favorites
    end
  end
end

namespace :admin do
  get '' => 'homes#top'
  resources :users, only: [:show, :edit, :update]
  resources :tags, only: [:index, :create, :edit, :destroy, :update]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
