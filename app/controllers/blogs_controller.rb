class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end
 
  def new
    @blog = Blog.new
  end

  def show
    @Blog = Blog.find(params[:id])
  end

  def create
    Blog.create(blog_parameter)
    redirect_to root_path
  end

  def destroy
    blog = Blog.find(params[:id])
     if blog.user_id == current_user.id
      blog.destroy #destroyメソッドを使用し対象のツイートを削除する。
     end
   end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_parameter)
      redirect_to blogs_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def blog_parameter
    params.require(:blog).permit(:title, :content, :start_time)
  end

end

