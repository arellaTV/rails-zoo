Rails.application.routes.draw do
  get 'homepage/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :zoos do
    resources :animals
  end

  namespace 'admin' do
    resources :zoos do
      resources :animals
    end
  end

  root 'homepage#index'
end
