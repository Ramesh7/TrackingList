TicketManagement::Application.routes.draw do
   #scope "" do
  resources :session do
    collection do
      get :new_user
      post :create_user
    end
  end
    resources :welcome
  root :to => 'session#new'
end
