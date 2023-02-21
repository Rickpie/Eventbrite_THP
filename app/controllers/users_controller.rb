class UsersController < ApplicationController
    before_action :authenticate_user!, :is_user
    def index
        @user = User.all
    end

    def show
        @user = User.find(params[:id])
        @admin_event = Event.all
    end

    private 


    def is_user
        @user = User.find(params['id'])
        if current_user.id == @user.id
        else
          redirect_to root_path

        end

      end

end