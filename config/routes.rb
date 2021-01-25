Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do

      resources :users do
        member do
          get :online
          get :offline
        end
      end

      resources :conversation do
        collection do
          get 'user_conversation/:idUser', to: 'conversation#user_conversation'
        end
      end

    end
  end
end
