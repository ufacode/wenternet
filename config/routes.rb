Rails.application.routes.draw do
  root 'main#index'
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  resources :items do
    member do
      post :plus_rating
      post :minus_rating
    end
  end
  resources :search, only: [:index, :create]
  resources :profiles, only: [:index, :show, :edit, :update]

  namespace :admin do
    get '/', to: 'dashboard#index', as: :dashboard
    resources :categories, except: :show
    resources :subcategories, except: :show
    resources :cities, except: :show
    resources :users, except: :show
  end

  get "/:city", to: "items#city", as: :city
  get "/:city/:category", to: "items#category", as: :category
  get "/:city/:category/:subcategory", to: "items#subcategory", as: :subcategory
  get "/:city/:category/:subcategory/:id", to: "items#show"
end
