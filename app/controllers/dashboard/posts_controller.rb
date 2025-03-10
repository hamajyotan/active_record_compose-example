class Dashboard::PostsController < Dashboard::ApplicationController
  before_action :set_new_post, only: %i[new create]

  def new; end

  def create
    if @post.update(post_params)
      @post.broadcast_prepend_to :posts
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_new_post
    @post = current_user.posts.build
  end

  def post_params
    params.expect(post: %i[content])
  end
end
