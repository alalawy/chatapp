class Api::V1::MessagesController < ApplicationController

    # GET    /api/v1/message
    def index
        messages = Message.order('created_at DESC')
        render json: {status: 'SUCCESS', message:'Loaded messages', data: messages}, status: :ok
    end

    # GET    /api/v1/message/:id
    def show
        message = Message.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded message', data: message}, status: :ok
    end

    # POST   /api/v1/message
    def create
        message = Message.new(messageParams)

        if message.save 
            render json: {status: 'SUCCESS', message:'message saved', data: message}, status: :ok
        else
            render json: {status: 'ERROR', message:'Error save message', data: message.errors}, status: :unprocessable_entity
        end
    end

    # DELETE /api/v1/message/:id
    def destroy
        message = Message.find(params[:id])
        message.destroy
        render json: {status: 'SUCCESS', message:'Message deleted', data: message}, status: :ok
    end

end
