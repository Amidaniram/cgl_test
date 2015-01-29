class User < ActiveRecord::Base

  has_one :profile
  attr_accessor :password

  validates :password, presence: true, confirmation: true, length: { in: 6..50 }
  validates :email, uniqueness: true, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :username, uniqueness: true, presence: true, length: { in: 3..20 }

  before_validation :prep_email
  before_save :encrypt_password

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, self.salt)
    end
  end

  private
    def prep_email
     self.email.downcase!
    end
end
