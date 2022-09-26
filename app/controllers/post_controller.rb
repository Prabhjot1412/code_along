class PostController < ApplicationController
  def index
    Pagy::DEFAULT[:items] = 5
    @pagy, @posts = pagy(current_user.posts.order(title: :asc))
  end

  def create
    @post = current_user.posts.new(user_parameters)
    if @post.save
      create_alert_and_redirect("post created Successfully", post_index_path)
    else
      create_alert_and_redirect(@post.errors.full_messages.join("\n"), post_index_path)
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    authorize! :destroy, @post
    @post.destroy ? create_alert_and_redirect("post deleted Successfully", post_index_path) : create_alert_and_redirect("something went wrong", post_index_path)
  end
  private
  def user_parameters
    params.permit(:title, :body, :premium)
  end
end
