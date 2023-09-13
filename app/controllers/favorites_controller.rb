class FavoritesController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    if !book.favorited_by?(current_user)
      favorite = current_user.favorites.new(book_id: book.id)
      favorite.save
    end
    redirect_to request.referer
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    redirect_to request.referer
  end
end
