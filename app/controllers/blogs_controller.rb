class BlogsController < ApplicationController
  
  before_action :set_blog, only: [:edit, :update, :destroy, :show]
  before_action :set_blog_user, only: [:edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        BlogMailer.blog_mail(@blog).deliver
        redirect_to blogs_path, notice: "投稿しました"
      else
        render :new
      end
    end
  end

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "編集しました"
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "削除しました"
  end

  def confirm
    @blog = current_user.blogs.build(blog_params)
    @blog.id = params[:id]
    render :new if @blog.invalid?
  end

  def favorited
    @favorited = current_user.favorite_blogs
  end

  private
  def blog_params
    params.require(:blog).permit(:id, :image, :image_cache, :content, :remove_image)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def set_blog_user
    if current_user.id == @blog.user_id
    else
      redirect_to blogs_path, notice: "権限がありません" 
    end
  end

end