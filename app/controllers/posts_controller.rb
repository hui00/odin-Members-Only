class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.where(user_id: current_user.id)
  end

  def new
    @post = Post.new
  end

  def create
    # @post = Post.new(_params)
    @post = Post.new(params.require(:post).permit(:title, :body, :user_id))
    if @post.save
      puts("Post saved")
      flash[:success] = "Post created"
      redirect_to root_path
    else
      # show errors
      puts (params[:title])
      # puts("User not saved: " + @post.errors.full_messages.to_s)
      flash[:danger] = "Post not saved: " + @post.errors.full_messages.to_s
      render :new, status: :unprocessable_entity
    end
  end
end
