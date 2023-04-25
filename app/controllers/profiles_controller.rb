class ProfilesController < ApplicationController
  def index
    @users = users
  end

  def users
    # following_ids = current_user.following_ids
    # @q = User.where(id: following_ids).ransack(params[:q])
    # @users = @q.result(distinct: true)
    query = User.ransack(username_cont: search_query)
    @users = query.result(distince: true)
  end
  def search_query
    params[:query]
  end
end
