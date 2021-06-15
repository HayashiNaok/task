class CompletesController < ApplicationController
    before_action :authenticate_user!
    def new
        @complete = Complete.new
    end

    
    def show
      if params[:search] == nil
        @completes = Complete.all
      elsif params[:search] == ''
        @completes = Complete.all
      else
        #部分検索
        @completes = Complete.where("body LIKE ? ",'%' + params[:search] + '%')
      end
    end

   
    def update
        complete = Complete.find(params[:id])
        complete.user_id = current_user.id
        if complete.update(complete_params)
          redirect_to :action => "show", :id => complete.id
        else
          redirect_to :action => "new"
        end
    end

    def edit
        @complete = Complete.find(params[:id])
       
      

    end

    def destroy
      tweet = Complete.find(params[:id])
      tweet.destroy
      redirect_to action: :show
    end

    def create
        complete = Complete.new(complete_params)
        complete.user_id = current_user.id
        if complete.save
          redirect_to :action => "show"
        else
          redirect_to :action => "new"
        end
    end
    
    def index
      @complete = Complete.find(params[:id])
    end

    private
    def complete_params
        params.require(:complete).permit(:task)
    end


    
end
