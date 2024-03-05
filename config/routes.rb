Rails.application.routes.draw do

  # 顧客用
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: 'homes#top'
    resources :stores do
      resource :favorites, only: [:create, :destroy]
      resources :store_comments, only: [:create, :destroy]
    end
    # 退会機能追加する
    resources :users, only: [:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get "followings" => "relationships#followings", as: "followings"
      get "followers" => "relationships#followers", as: "followers"
      get 'check' => 'users#check', as: 'check'
      get 'thanks' => 'users#thanks', as: 'thanks'
    patch 'withdraw' => 'users#withdraw', as: 'withdraw'
    end
    resource :map, only: [:show] do
      get 'search', on: :collection
    end
    get '/store/hashtag/:name' => 'stores#hashtag'
    get '/store/hashtag' => 'stores#hashtag'
  end

  namespace :admin do
    root to: 'users#index'
    resources :stores, only: [:index, :show, :destroy]
    resources :users, only: [:index, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
