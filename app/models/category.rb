class Category < ActiveRecord::Base

  #this allows
  has_many :article_categories
  has_many :articles, through: :article_categories

  validates :name, presence: true, length: { minimum: 3, maximum: 25} #referenced in category_test.rb file
  validates_uniqueness_of :name # ensures name is unique, referenced in category_test.rb file

end