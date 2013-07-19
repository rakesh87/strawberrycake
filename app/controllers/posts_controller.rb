class PostsController < ApplicationController

  def index
    #listar os posts
    @post = Post.all
  end
end
