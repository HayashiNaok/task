class CompletesController < ApplicationController
    before_action :authenticate_user!
    def new
        @complete = Complete.new
    end

    
    def show
      if params[:search] != nil && params[:search] != ''
        #部分検索かつ複数検索
        search = params[:search]
        @completes = Complete.joins(:user).where("task LIKE ? OR email LIKE ?", "%#{search}%", "%#{search}%")
        @completes = Kaminari.paginate_array(@completes).page(params[:page]).per(10)
      else
        @completes = Complete.all
        @completes = Kaminari.paginate_array(@completes).page(params[:page]).per(10)
      end
    end


   
    def update
        complete = Complete.find(params[:id])
        complete.user_id = current_user.id
        if complete.update(complete_params)
          redirect_to controller: :user, action: :show, id: complete.id
        else
          redirect_to :action => "new"
        end
    end

    def edit
        @complete = Complete.find(params[:id])
       
      

    end

    def destroy
      @complete = Complete.find(params[:id])
      @complete.destroy
      redirect_to action: :show
    end

    def create
        complete = Complete.new(complete_params)
        complete.user_id = current_user.id
        if complete.save
          redirect_to controller: :user, action: :show, id: complete.id
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
