class NewsController < ApplicationController
  def new
    if session[:user_id]
      @news = News.new
    else
      redirect_to game_root_path
    end
  end

  def create
    @news = News.new(news_params)
    @news.profile = User.find(session[:user_id]).profile
    @news.game = Game.find(params[:news][:game])
    if @news.save
      redirect_to news_path(@news, game: params[:game])
    else
      render 'new'
    end
  end

  def delete

  end

  def index
     #@news = News.order("created_at DESC").limit(6)
    redirect_to game_root_path
  end

  def update

  end

  def show
    @news = News.find(params[:id])
  end

  private
    def news_params
      params[:news].permit(:title, :text, :short_text, :avatar)
    end
end
