class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :approve]
  
  def index
    @posts = Post.posts_by(current_user).page(params[:page])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: 'Your post was created successfully'
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    authorize @post
  end

  def update
    authorize @post
    
    if @post.update(post_params)
      redirect_to post_path(@post), notice: 'Your post was edited successfully'
    else
      render 'edit'
    end
  end

  def destroy 
    if @post.destroy
      redirect_to posts_path, notice: 'Your post was deleted successfully'
    else
      render 'index'
    end
  end

  def approve
    authorize @post
    @post.approved!
    redirect_to root_path, notice: 'The post has been approved'
  end

  private
  
  def post_params
    params.require(:post).permit(:date, :rationale, :status, :overtime_request)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
