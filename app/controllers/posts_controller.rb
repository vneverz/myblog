class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
          flash[:notice] = "Post successfully created"
          redirect_to post_path(@post)
    else
        render :new
    end

  end

  def show

  end

  def edit

  end

  def update

    if  @post.update(post_params)
        flash[:notice] = "Post successfully updated"
        redirect_to post_path(@post)
    else
        render :edit
    end
  end

  def destroy

    @post.destroy
    flash[:notice] = "Post successfully destroied"
    redirect_to posts_path
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
