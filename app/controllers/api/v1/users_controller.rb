module Api
    module V1
        class UsersController < ApplicationController

            def index
                users = User.order('created_at DESC')
                render json: {status: 'SUCCESS', message:'Loaded users', data: users}, status: :ok
            end

            def show
                user = User.find(params[:id])
                render json: {status: 'SUCCESS', message:'Loaded user', data: user}, status: :ok
            end

            def create
                user = User.new(userParams)

                if user.save 
                    render json: {status: 'SUCCESS', message:'user saved', data: user}, status: :ok
                else
                    render json: {status: 'ERROR', message:'Error save user', data: user.errors}, status: :unprocessable_entity
                end
            end

            def destroy
                user = User.find(params[:id])
                user.destroy
                render json: {status: 'SUCCESS', message:'User deleted', data: user}, status: :ok
            end

            def online
                user = User.find(params[:id])
                user.update_attribute :status, 1
                
                render json: {status: 'SUCCESS', message:'User online', data: user}, status: :ok
            end

            def offline
                user = User.find(params[:id])
                user.update_attribute :status, 0
                
                render json: {status: 'SUCCESS', message:'User offline', data: user}, status: :ok
            end

            private
            def userParams
                params.permit(:nama, :nomorHp, :status).with_defaults(status: 0)
            end
        end 
    end
end
