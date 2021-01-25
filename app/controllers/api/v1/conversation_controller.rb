class Api::V1::ConversationController < ApplicationController
    def index
        conversations = Conversation.order('created_at DESC')
        render json: {status: 'SUCCESS', message:'Loaded conversations', data: conversations}, status: :ok
    end

    def show
        conversation = Conversation.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded conversation', data: conversation}, status: :ok
    end

    def create
        conversation = Conversation.new(conversationParams)

        if conversation.save 
            render json: {status: 'SUCCESS', message:'conversation saved', data: conversation}, status: :ok
        else
            render json: {status: 'ERROR', message:'Error save conversation', data: conversation.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        conversation = Conversation.find(params[:id])
        conversation.destroy
        render json: {status: 'SUCCESS', message:'Conversation deleted', data: conversation}, status: :ok
    end

    private
    def conversationParams
        params.permit(:idCreator, :idReceiver)
    end
end
