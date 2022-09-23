class PostController < ApplicationController
  def index
    Pagy::DEFAULT[:items] = 5
    @pagy, @posts = pagy(current_user.posts.order(title: :asc))
  end

  def create
    if current_user.posts.create(user_parameters)
      create_alert_and_redirect("post created Successfully", post_index_path)
    else
      create_alert_and_redirect("unable to create post", post_index_path)
    end
  end
  private
  def user_parameters
    params.permit(:title, :body)
  end
end
