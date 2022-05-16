class BoardsController < ApplicationController

  def index
    @board = Board.all
  end

  def show
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to board_path(@board)
    else
      render :new
    end
  end

  private
  def board_params
    params.require(:board).permit(:name, :description)
  end
end