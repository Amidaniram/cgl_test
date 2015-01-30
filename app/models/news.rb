class News < ActiveRecord::Base
  belongs_to :profile
  belongs_to :game

  validates :title, presence: true
  validates :short_text, presence: true
  validates :text, presence: true
  validates :profile_id, presence: true
end
