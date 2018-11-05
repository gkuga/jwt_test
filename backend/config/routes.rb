Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :cars, only: [:index, :create]
      post 'login' => 'auth#login'
    end
  end
end
