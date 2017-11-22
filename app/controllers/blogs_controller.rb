class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to @blog, :notice=>"successfully created"
    else
      render 'new'
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @commentable = @blog
    @comments = @commentable.comments
    @comment = Comment.new
  end
  
  def edit
    @blog = Blog.find(params[:id])
  end
  
  def update
    @blog = Blog.find(params[:id])
    @blog.update_attributes(blog_params)
    redirect_to @blog, :notice=>"successfully updates"
  end
  
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
   end
   private
   def blog_params
   	params.require(:blog).permit(:title, :body)
  end
end