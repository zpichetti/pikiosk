class ArticlesController < ApplicationController
  def index
    @board = Board.find(params[:board_id])
    @articles = Article.where(board: @board)
  end

  def new
    @board = Board.find(params[:board_id])
    @article = Article.new
  end

  def create
    @article = Article.new(create_params)
    @board = Board.find(params[:board_id])
    @article.board = @board
    if @article.save
      redirect_to board_articles_path(@board)
    else
      render :new
    end
  end

  def edit
    @board = Board.find(params[:board_id])
    @article = Article.find(params[:id])
  end

  def update
    @board = Board.find(params[:board_id])
    @article = Article.find(params[:id])
    @article.update(create_params)
    redirect_to board_articles_path(@board)
  end

  def destroy
    @board = Board.find(params[:board_id])
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to board_articles_path(@board)
  end

  private

  def create_params
    params.require(:article).permit(:title, :date, :end_date, :photo)
  end
end
