class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :newses

  validates :first_name, length: { maximum: 50 }
  validates :last_name, length: { maximum: 50 }
  validates :skype, length: { maximum: 50 }
  validates :country, length: { maximum: 50 }
  validates :vk, length: { maximum: 50 }
end
