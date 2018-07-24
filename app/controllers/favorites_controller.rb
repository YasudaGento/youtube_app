class FavoritesController < ApplicationController
  
  def create
    @favorite=Favorite.new(user_id: current_user.id, video_id: params[:video])
    @favorite.save
    flash[:success] ="お気に入りに登録しました！！"
    redirect_to "/youtubes/#{@favorite.video_id}"
  end
  
  def destroy
    @favorite=Favorite.find_by(user_id: current_user.id, video_id: params[:video])
    @favorite.destroy
    flash[:success] ="お気に入りから外しました"
    redirect_to "/youtubes/#{@favorite.video_id}"
  end
end