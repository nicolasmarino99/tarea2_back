Rails.application.routes.draw do
  devise_for :users, path: 'api/v1', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'api/v1/users/sessions',
    registrations: 'api/v1/users/registrations'
  }
  namespace :api do
    namespace :v1 do
      get 'products/by_user/:username', to: 'products#user_products_by_username'
      resources :products
    end
  end
end
