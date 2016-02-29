class PostsController < ApplicationController

before_action :find_post, only: [:show, :edit, :update, :destroy]
before_action :authenticate_admin!, except: [:index, :show]

  def index
    @post = Post.all
    @category = Post.uniq.pluck(:category)

    if params[:category]
      @post = Post.where(:category => params[:category])
    else
      @post = Post.all
    end
  end

  def new
    @post = Post.new
    @category = Post.uniq.pluck(:category)
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to @post
    else
      render 'new', notice: "Unable to save"
    end
  end

  def show
  end

  def edit
    @category = Post.uniq.pluck(:category)
  end

  def update
    if @post.update post_params
      redirect_to @post, notice: "Updated"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :category, :image, :main_page)
  end

  def find_post
    @post = Post.find_by_title(params[:id])
  end
end
