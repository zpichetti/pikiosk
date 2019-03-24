class BoardsController < ApplicationController
  before_action :authenticate_user! , only: [:show]

  def index
    @boards = Board.all
  end

  def show
    @board = Board.find_by(link: params[:link])
    @meteo = @board.meteo
    @calendars = Calendar.where(board: @board).order(:date)
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
      render :new
    end
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    @board.update(create_params)
    redirect_to boards_path()
  end

  private

  def create_params
    params.require(:board).permit(:name, :location)
  end
end
