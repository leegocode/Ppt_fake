class BoardsController < ApplicationController

  before_action :find_board, only: [:show, :edit, :update, :destroy , :favorite]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @boards = Board.where(deleted_at: nil)
  end

  def show
    @post = @board.posts.includes(:user)
    @favorite_or_not = current_user.favorited_boards.where(id: @board.id)
    # @board = Board.find(params[:id])
  end


  def favorite
    current_user.toggle_favorite_board(@board)
    redirect_to favorites_path(from_board: @board.id), notice: 'OK!'
  end

  def new
      @board = Board.new
  end

  def edit
    # @board = Board.find(params[:id])
  end


  def create
    @board = Board.new(board_params)

    if @board.save
      # flash[:notice] = "new article!"
      redirect_to boards_path, notice: "新增成功"
      # OK
    else
      render :new
      # NG
    end
    # Board.create(title: params[:title], intro: params[:intro])
    # redirect_to "/"
  end

  def update
    # @board = Board.find(params[:id])
    if @board.update(board_params)
      redirect_to boards_path, notice: "更新成功"
    else
      render :edit
    end
  end

  def destroy
    # @board = Board.find(params[:id])
    @board.destroy
    redirect_to boards_path
  end

  private

  def find_board
    @board = Board.find(params[:id])
  end




  def board_params
    params.require(:board).permit(:title, :intro)
  end

  def require_user_sign_in
    redirect_to root_path, notice: "請登入會員" if not user_sign_in?
  end

end
