Rails.application.routes.draw do
  devise_for :users
  get 'homepage/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :zoos do
    resources :animals
  end

  namespace 'admin' do
    resources :zoos do
      resources :animals
    end

    resources :animals
  end

  get '/user' => "admin/zoos#index", :as => :user_root

  root 'homepage#index'
end
