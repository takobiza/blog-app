class BlogsController < ApplicationController

  before_action :blog_new, only:[:index, :new]
  before_action :blog_find, only:[:edit, :update, :destroy]

  def index
    @blogs = Blog.page(params[:page]).per(5).order("updated_at DESC")
    @user = User.new
  end

  def show

  end

  def new
  end

  def create
    @blog = Blog.create(blog_params)
    flash[:notice] = "投稿しました"
    redirect_to blogs_path
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path
  end

  def edit
  end

  def update
    @blog.update(blog_params)
    flash[:notice] = "更新しました"
    redirect_to blogs_path(params[:page])
  end

  private
  def blog_params
    params.require(:blog).permit(:content).merge(user_id: current_user.id)
  end

  def blog_new
    @blog = Blog.new
  end

  def blog_find
    @blog = Blog.find(params[:id])
  end
end
