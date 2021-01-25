class Api::V1::UsersController < ApplicationController

    # GET    /api/v1/users
    def index
        users = User.order('created_at DESC')
        render json: {status: 'SUCCESS', message:'Loaded users', data: users}, status: :ok
    end

    # GET    /api/v1/users/:id
    def show
        user = User.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded user', data: user}, status: :ok
    end

    # POST   /api/v1/users
    def create
        user = User.new(userParams)

        if user.save 
            render json: {status: 'SUCCESS', message:'user saved', data: user}, status: :ok
        else
            render json: {status: 'ERROR', message:'Error save user', data: user.errors}, status: :unprocessable_entity
        end
    end

    # DELETE /api/v1/users/:id
    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: {status: 'SUCCESS', message:'User deleted', data: user}, status: :ok
    end

    # GET    /api/v1/users/:id/online
    def online
        user = User.find(params[:id])
        user.update_attribute :status, 1
        
        render json: {status: 'SUCCESS', message:'User online', data: user}, status: :ok
    end

    # GET    /api/v1/users/:id/offline
    def offline
        user = User.find(params[:id])
        user.update_attribute :status, 0
        
        render json: {status: 'SUCCESS', message:'User offline', data: user}, status: :ok
    end

    # Parameters for create user
    private
    def userParams
        params.permit(:nama, :nomorHp, :status).with_defaults(status: 0)
    end
end 
