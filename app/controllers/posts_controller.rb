class PostsController < ApplicationController


  def new
    @board = Board.find(params[:board_id])
    @post = @board.posts.new
  end




end
