class UserController < ApplicationController
    before_action :authenticate_user!
    def index
    end

    def show
        @blogs = Blog.where(user_id: current_user.id) 
        
    end
end
