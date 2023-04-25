class LikesController < ApplicationController
  def create
    puts "create action called for like"
    if current_user.nil?
      redirect_to new_user_registration_path
    else
      @like = current_user.likes.new(like_params)
      if @like.save
        redirect_to root_path
      else
        flash[:alert]= "You already liked this post"
        redirect_to post_path(@like.post)
      end
    end
  end

  def destroy
    current_user.likes.find(params[:id]).destroy
    redirect_to root_path
  end

  def like_params
    params.require(:like).permit(:post_id)
  end
end
