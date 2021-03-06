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

      resources :messages do
        collection do
          get 'list/:idConversation', to: 'messages#list'
          post :sendmessage
          post :sendmessageauto
          get 'unread/:idConversation/:idUser', to: 'messages#unread'
          get 'read/:idConversation/:idUser', to: 'messages#read'
        end
      end

    end
  end
end
