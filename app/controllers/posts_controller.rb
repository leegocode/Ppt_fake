class PostsController < ApplicationController
 before_action :find_board, only: [:new , :create]
 before_action :authenticate_user!, except: [:show]

  def new
    @post = @board.posts.new
  end

  def show
     @post = Post.find(params[:id])
     @comment = @post.comments.new
     @comments = @post.comments.order(id: :desc)
  end

  def edit
   @post = current_user.posts.find(params[:id])

   unless @post.exist
     redirect_to root_path, notice: '沒有權限'
   end
 end


  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: '文章更新成功'
    else
      render :edit
    end
  end


  def create
    @post = @board.posts.new(post_params)

    if @post.save

      # SendmailJob.set(wait: 10.seconds).perform_later(@post)
      redirect_to @board, notice: "add new post!"
    else
      render 'new'
    end
  end

  def edit
   @post = current_user.posts.find(params[:id])
  end

 def update
   @post = current_user.posts.find(params[:id])
   if @post.update(post_params)
     redirect_to @post, notice: '文章更新成功'
   else
     render :edit
   end
 end




private
def find_board
  @board = Board.find(params[:board_id])
end



def post_params
params.require(:post).permit(:title , :content, :photo).merge(user: current_user)
end

end
