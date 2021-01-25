class Api::V1::MessagesController < ApplicationController

   

    def list
        message = Message.where('idConversation = ?', params[:idConversation])
        render json: {status: 'SUCCESS', message:'Loaded message', data: message}, status: :ok
    end

    def sendmessage
        conversationSender = Conversation.where('idCreator = ? and idReceiver = ?', params[:idSender], params[:idReceiver])
        
        if conversationSender.length() > 0
            idConversation = conversationSender[0]['id']
        else
            conversationSender = Conversation.where('idCreator = ? and idReceiver = ?', params[:idReceiver], params[:idSender])
            if conversationSender.length() > 0
                idConversation = conversationSender[0]['id']
            else
                conversation = Conversation.new
                conversation.idCreator = params[:idSender]
                conversation.idReceiver = params[:idReceiver]
                if conversation.save 
                    conversationSender = Conversation.where('idCreator = ? and idReceiver = ?', params[:idSender], params[:idReceiver])
                    idConversation = conversationSender[0]['id']
                end
            end
        end
        
        message = Message.new
        message.idConversation = idConversation
        message.idSender = params[:idSender]
        message.message = params[:message]
        message.messageType = "Text"
        message.status = 0

        if message.save 
            render json: {status: 'SUCCESS', message:'message sent', data: message}, status: :ok
        else
            render json: {status: 'ERROR', message:'Error sent message', data: message.errors}, status: :unprocessable_entity
        end
    end
  
    # DELETE /api/v1/message/:id
    def destroy
        message = Message.find(params[:id])
        message.destroy
        render json: {status: 'SUCCESS', message:'Message deleted', data: message}, status: :ok
    end


end
