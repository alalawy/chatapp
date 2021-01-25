Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users do
        member do
          get :online
          get :offline
        end
      end
    end
  end
end
