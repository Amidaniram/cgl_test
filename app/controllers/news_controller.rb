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

  def destroy
    @news = News.find(params[:id])
    if @news.profile == User.find(session[:user_id]).profile
      if @news.delete
        redirect_to game_root_path
      else
        redirect_to news_path(@news, game: params[:game])
      end
    else
      redirect_to game_root_path
    end
  end

  def index
     #@news = News.order("created_at DESC").limit(6)
    redirect_to game_root_path
  end

  def edit
    @news = News.find(params[:id])
    if !session[:user_id] || @news.profile != User.find(session[:user_id]).profile
      flash[:notice] = "Не твоя новость, не тебе и править!"
      redirect_to game_root_path
    end
  end

  def update
    @news = News.find(params[:id])
    if @news.profile == User.find(session[:user_id]).profile
      if @news.update_attributes(news_params)
        redirect_to news_path(@news, game: params[:game])
      else
        render 'edit'
      end
    else
      redirect_to game_root_path
    end
  end

  def show
    @news = News.find(params[:id])
  end

  private
    def news_params
      params[:news].permit(:title, :text, :short_text, :avatar)
    end
end
