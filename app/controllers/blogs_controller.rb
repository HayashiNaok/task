class BlogsController < ApplicationController
  before_action :authenticate_user!
  def index
    @blogs = Blog.where(user_id: current_user.id)
  end
  
  def search
    if params[:search] != nil && params[:search] != ''
      #部分検索かつ複数検索
      search = params[:search]
      @blogs = Blog.joins(:user).where("name LIKE ? OR content LIKE ?", "%#{search}%", "%#{search}%").page(params[:page]).per(20)
    else
      @blogs = Blog.all.page(params[:page]).per(20)
    end
  end

  def new
    @blog = Blog.new
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def create
    blog = Blog.new(blog_params)
    

    #追加箇所
    blog.user_id = current_user.id
    #ここまで

    if blog.save
      redirect_to action: "index"
    else
      redirect_to action: "new"
    end
    
   
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice:"削除しました"

  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title,:start_time, :content)
  end

end
