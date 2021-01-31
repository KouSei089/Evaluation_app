Rails.application.routes.draw do
  get 'evaluation', to: 'evaluation#index'

  namespace :api, format: 'json' do
    resources :evaluations, only: [:index, :create]
  end
end
