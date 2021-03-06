class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy # dependent and destroy reference users_controllers.rb file
  before_save { self.email = email.downcase }
  # this ensures the username is present in our application, and that
  # each username is unique
  validates :username, presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 25 }
  # this checks for valid emails wth correct format using a regular expression
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 105},
            uniqueness: { case_sensitive: false},
            format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end