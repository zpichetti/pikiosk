class CalendarsController < ApplicationController
  def index
    @board = Board.find(params[:board_id])
    @calendars = Calendar.where(board: @board).order(:date)
  end
  
  def show
  end

  def new
    @board = Board.find(params[:board_id])
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.new(create_params)
    @board = Board.find(params[:board_id])
    @calendar.board = @board
    if @calendar.save
      redirect_to board_calendars_path(@board)
    else
      render :new
    end
  end

  def edit
    @board = Board.find(params[:board_id])
    @calendar = Calendar.find(params[:id])
    
  end

  def update
    @board = Board.find(params[:board_id])
    @calendar = Calendar.find(params[:id])
    @calendar.update(create_params)
    redirect_to board_calendars_path(@board)
  end

  private

  def create_params
    params.require(:calendar).permit(:title, :date, :location, :city)
  end
end
