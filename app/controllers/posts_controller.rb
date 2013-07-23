class PostsController < ApplicationController

  def index
    #listar os posts
    @posts = Post.all
  end
end
