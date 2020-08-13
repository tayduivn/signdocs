Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static_pages#root"
  namespace :api, defaults: { format: :json } do
    resources :users, only: [:index, :show, :create, :update]
    resources :documents, only: [:index, :show, :create, :update, :destroy] do
      resources :content_fields, shallow: true, only: [:index, :show, :create, :update, :destroy]
      member do 
        get 'final'
        post 'final'
      end
    end
    resources :sentinel_blocks, only: [:show, :update]
    resources :signature_blocks, only: [:show, :update]
    resources :text_blocks, only: [:show, :update]
    resource :session, only: [:create, :destroy]
  end
end
