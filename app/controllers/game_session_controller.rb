class GameSessionController < ApplicationController
  def new
    render layout: false
  end
  def show
    @news = News.order("created_at DESC").limit(6)
  end
end
