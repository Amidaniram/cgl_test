class News < ActiveRecord::Base
  belongs_to :profile
  belongs_to :game

  has_attached_file :avatar, styles: { thumb: "240x" },
                    url: "/assets/news/:id/:style/:basename.:extension",
                    default_url: "news-thumb.jpg",
                    path: ":rails_root/public/assets/news/:id/:style/:basename.:extension"
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/jpg', 'image/png']
  validates_attachment_size :avatar, less_than: 10.megabytes

  validates :title, presence: true
  validates :short_text, presence: true
  validates :text, presence: true
  validates :profile_id, presence: true
end
