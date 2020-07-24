class BoardsController < ApplicationController

  def index
  @boards = Board.all

  end


   def new
    @boards = Board.all
   end

  def create
    render html: params[:title]

  end

end
