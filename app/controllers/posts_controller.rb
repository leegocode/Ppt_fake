class PostsController < ApplicationController
 before_action :find_board, only: [:new , :create]

  def new
    @post = @board.posts.new
  end

  def show
    @post = Post.find_by(permalink: params[:permalink])
  end


  def create
    @post = @board.posts.new(post_params)

    if @post.save
      redirect_to @board, notice: "add new post!"
    else
      render 'new'
    end


  end

private
def find_board
  @board = Board.find(params[:board_id])
end



def post_params
params.require(:post).permit(:title , :content)
end

end
