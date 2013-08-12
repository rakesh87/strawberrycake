class PostsController < ApplicationController
  before_filter :authenticate!
  before_filter :set_post, only: [:edit, :update, :destroy]  

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(params[:post])
    if @post.save
      redirect_to posts_path, notice: "Post criado com sucesso!"
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
    if @post.update_attributes(params[:post])
      redirect_to posts_path, notice: "Post atualizado com sucesso!"
    else
      render 'edit'
    end
  end  

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post deletado com sucesso!"
  end

  private

  def set_post
    @post = current_user.posts.find(params[:id])
  end
end
