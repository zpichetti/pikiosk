class ArticlesController < ApplicationController
  def index
    @articles = Article.find_by(board: @params[:board_id])
  end

  def new
    @article = Article.new
  end

  def create
    
  end

  def show
  end
end
