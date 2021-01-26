class Api::V1::ConversationController < ApplicationController

    # GET    /api/v1/conversation
    def index
        conversations = Conversation.order('created_at DESC')
        render json: {status: 'SUCCESS', message:'Loaded conversations', data: conversations}, status: :ok
    end

    # GET    /api/v1/conversation/:id
    def show
        conversation = Conversation.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded conversation', data: conversation}, status: :ok
    end

    # POST   /api/v1/conversation
    def create
        conversationSender = Conversation.where('idCreator = ? and idReceiver = ?', params[:idCreator], params[:idReceiver])
        
        if conversationSender.length() > 0
            render json: {status: 'ERROR', message:'Error save conversation, Conversation already registered'}, status: :unprocessable_entity
        else
            conversationSender = Conversation.where('idCreator = ? and idReceiver = ?', params[:idReceiver], params[:idCreator])
            if conversationSender.length() > 0
                render json: {status: 'ERROR', message:'Error save conversation, Conversation already registered'}, status: :unprocessable_entity
            else
                conversation = Conversation.new(conversationParams)

                if conversation.save 
                    render json: {status: 'SUCCESS', message:'conversation saved', data: conversation}, status: :ok
                else
                    render json: {status: 'ERROR', message:'Error save conversation', data: conversation.errors}, status: :unprocessable_entity
                end
            end
        end
    end

    # DELETE /api/v1/conversation/:id
    def destroy
        conversation = Conversation.find(params[:id])
        conversation.destroy
        render json: {status: 'SUCCESS', message:'Conversation deleted', data: conversation}, status: :ok
    end

    # GET /api/v1/conversation/user_conversation/:idUser
    def user_conversation
        conversation = Conversation.where('idCreator = ? OR idReceiver = ?', params[:idUser], params[:idUser])
        render json: {status: 'SUCCESS', message:'Loaded conversation', data: conversation}, status: :ok
    end

    # Parameters for create conversation
    private
    def conversationParams
        params.permit(:idCreator, :idReceiver)
    end
end
