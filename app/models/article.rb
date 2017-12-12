class Article < ActiveRecord::Base

  belongs_to :user
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 200}
  # ensures that any article we create has a user id
  validates :user_id, presence: true
end