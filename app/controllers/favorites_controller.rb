class FavoritesController < ApplicationController

  def create
    @blog = Blog.find(params[:blog_id])
    
    favorite = current_user.favorites.build(blog_id: params[:blog_id])
    favorite.save
    
    #favorite = current_user.favorites.create(blog_id: params[:blog_id])
    #redirect_to blogs_path, notice: "#{favorite.blog.user_name}さんのブログをお気に入り登録しました"
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    
    favorite = Favorite.find_by(blog_id: params[:blog_id], user_id: current_user.id)
    favorite.destroy
    
    #favorite = current_user.favorites.find_by(id: params[:id]).destroy
    #redirect_to blogs_path, notice: "#{favorite.blog.user_name}さんのブログをお気に入り解除しました"
  end

end
