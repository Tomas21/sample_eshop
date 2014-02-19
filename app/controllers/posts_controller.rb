class PostsController < ApplicationController
  def index
    @posts = Post.published
    @categories = Category.all
  end

  def show
    @post = Post.published.find params[:id]
    @comments = @post.comments
    @comment = Comment.new
  end

  def vote_up
    @post = Post.find params[:id]
    @post.votes_up += 1
    @post.save

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  def vote_down
    @post = Post.find params[:id]
    @post.votes_down += 1
    @post.save

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
end
