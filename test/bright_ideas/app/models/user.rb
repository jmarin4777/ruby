class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :likes, dependent: :destroy
  has_many :posts_liked, through: :likes, source: :post

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :username, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, length: { minimum: 8 }

  before_save :downcase_email

  private
  def downcase_email
    self.email.downcase!
  end
end
