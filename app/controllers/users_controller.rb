class UsersController < ApplicationController

    def index
        @user = User.all
    end

    def show
        @user = Gossip.find_by(params[:id]) 
    end

    def new
        @user = User.new
    end

    def create
        user = User.create(email: params['email'], password: params['password'])
      
        if user.save
            redirect_to "/", notice: 'User was successfully created.'
          else
            render 'new'
          end
        end

    def destroy
        @gossip = Gossip.find(params[:id])
        @gossip.destroy
        redirect_to "/"
    end


        private

  def user_params

    params.require(:user).permit(:email, :password)
  end
      
end
