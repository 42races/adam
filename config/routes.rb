Rails.application.routes.draw do
  devise_for :users
  resource :profiles

  root 'pages#index'

  get '/:username', to: 'profiles#show'
end
