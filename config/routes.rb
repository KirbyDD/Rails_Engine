Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/', to: 'search#index'
        get '/:id', to: 'search#show'
        get '/:id/items', to: 'relations#index'
        post '/', to: 'search#create'
        patch '/:id', to: 'search#update'
        delete '/:id', to: 'search#destroy'
      end

      namespace :items do
        get '/', to: 'search#index'
        get '/:id', to: 'search#show'
        get '/:id/merchant', to: 'relations#show'
        post '/', to: 'search#create'
        patch '/:id', to: 'search#update'
        delete '/:id', to: 'search#destroy'
      end
    end
  end
end
