Rails.application.routes.draw do
  root "warehouses#index"
  resources :warehouses do
    resources :sections do
      resources :zones do
        resources :items
      end
    end
    collection do
     get "search", to: "search#show"
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end