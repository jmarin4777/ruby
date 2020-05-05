class UsersController < ApplicationController
    def new
    end

    def show
        @user = User.where(id: params[:id])
        unless @user.empty?
            @user = @user[0]
            render 'users/show'
        else
            redirect_to "/bright_ideas"
        end
    end

    def create
        user = User.new(params_filtered)
        if user.valid?
            user.save
            flash[:errors] = ["User successfully registered, please login"]
            redirect_to "/users/new"
        else
            flash[:errors] = user.errors.full_messages
            redirect_to "/users/new"
        end
    end

    def home
        @user = current_user
        @posts = Post.all
        render 'users/home'
    end

    private
    def params_filtered
        params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
    end
end
