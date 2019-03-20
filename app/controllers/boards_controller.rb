class BoardsController < ApplicationController
  before_action :authenticate_user! , only: [:show]
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find_by(link: params[:link])
  end

  def new
    @board =Board.new
  end

  def create
    @board = Board.new(create_params)

    @board.link = (0...8).map { (65 + rand(26)).chr }.join
    if @board.save
      redirect_to board_path(@board.link)
    else
      render 'pages/landing'
    end
  end

  private

  def create_params
    params.require(:board).permit(:name)
  end
end
