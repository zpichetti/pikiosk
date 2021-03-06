class BoardsController < ApplicationController
  before_action :authenticate_user! , only: [:show]

  def index
    @boards = Board.all
  end

  def show
    today = Time.now
    @board = Board.find_by(link: params[:link])
    @meteo = @board.meteo
    @meteotime = ["Maintenant", "Dans 3h","Dans 6h"]
    @calendars = Calendar.where(board: @board).where("date > ?", Time.now - 1.hours).order(:date)
    @articles = Article.where(board: @board).where("end_date >= ?", Time.now).where("date <= ?", Time.now)
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

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to boards_path
  end

  private

  def create_params
    params.require(:board).permit(:name, :location)
  end
end
