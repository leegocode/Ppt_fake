class BoardsController < ApplicationController

  def index
    @boards = Board.all

  end

  def show
      @board = Board.find(params[:id])
  end


  def new
    @board = Board.new
  end

  def edit
    @board = Board.find(params[:id])
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
    @board = Board.find(params[:id])
    if @board.update(board_params)
      redirect_to boards_path, notice: "更新成功"
    else
      render :edit
    end
  end

  end




  private
  def board_params
    params.require(:board).permit(:title, :intro)
  end
