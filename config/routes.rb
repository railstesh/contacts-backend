Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "contacts#index"

  resources :contacts, only: [:create, :index, :destroy, :update] do
    resources :edit_versions, only: [:index]
  end
end
