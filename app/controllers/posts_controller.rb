class PostsController < ApplicationController
  before_action :set_user, except: [:index, :new, :create]

  def index
    @posts = Post.includes(:user, :media, likes: :user, comments: :user).all
  end

  def show
  end

  def new
    @posts = Post.new
  end

  def create
    @post = User.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "The post was deleted"
  end

  private

  def set_user
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:user).permit(:description, :user_id)
  end
  
end