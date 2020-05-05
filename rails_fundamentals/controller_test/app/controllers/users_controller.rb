class UsersController < ApplicationController
    def index
        if flash[:errors]
            render text: flash[:errors]
        else
            render json: User.all
        end
    end
    
    def new
        render 'new'
    end

    def show
        user = User.where(id: params[:id])
        # puts '*'*80, user.inspect, '*'*80
        unless user.empty?
            render json: user[0]
        else
            render text: "This user does not exist"
        end
    end

    def edit
        user = User.where(id: params[:id])
        unless user.empty?
            @user = user[0]
            render 'edit'
        else
            render text: "This user does not exist"
        end
    end

    def create
        user = User.new(name: "#{params["name"]}")
        if user.valid?
            user.save
        else
            errors = user.errors.full_messages
            puts errors
            flash[:errors] = errors
        end
        redirect_to "/users"
    end

    def total
        render text: "Total number of users: #{User.count}"
    end
end
