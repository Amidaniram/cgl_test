class Game < ActiveRecord::Base

  has_many :newses

  validates :short_name, uniqueness: true

  def save_games
    hs = Game.new
    hs.name = "HeartStone"
    hs.short_name = "hs"
    hs.save

    hots = Game.new
    hots.name = "Heroes of the Storm"
    hots.short_name = "hots"
    hots.save

    dota2 = Game.new
    dota2.name = "Dota 2"
    dota2.short_name = "dota2"
    dota2.save
  end
end
