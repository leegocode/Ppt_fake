class BoardsController < ApplicationController

  def index
    @boards = Board.all

  end

  def show
    begin
      @board = Board.find(params[:id])
    rescue
      render file: '/public/404.html', status: 404
    end
  end

  def new
    @board = Board.new
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




  private
  def board_params
    params.require(:board).permit(:title, :intro)
  end

end
