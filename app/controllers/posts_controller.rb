class PostsController < ApplicationController
  
  before_action :set_post, only: [:edit, :update, :destroy]
  
  def index
    @posts = Post.all
  end
  
  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end
  
  def create
    Post.create(post_params)
    redirect_to posts_path
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: "川柳を編集しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @post.destroy
    redirect_to posts_path, notice:"川柳を削除しました！"
  end
  
  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end
  
  private
  
  def post_params
    params.require(:post).permit(:content)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
  
end
