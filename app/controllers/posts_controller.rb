class PostsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category_id].present?
      @posts = Post.where(category_id: params[:category_id])
    else
      @posts = Post.all
    end
  end


  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user = current_user
    if @post.save
      if params[:from_profile]
          redirect_to profile_path, notice: "Post Created Successfully"
      else
          redirect_to posts_path, notice: "Post Created Successfully"
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      if params[:from_profile]
         redirect_to profile_path, notice: "Post Updated Successfully"
      else
         redirect_to posts_path, notice: "Post Updated Successfully"
      end
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    if params[:from_profile]
       redirect_to profile_path, notice: "Post are deleted Successfully"
    else
       redirect_to posts_path, notice: "Post are deleted Successfully"
    end
  end

  def profile
    @posts = current_user.posts
  end


  private 

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :image, :category_id)
  end

end
