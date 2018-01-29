class ArticleCategory < ApplicationRecord

  # referenced in article.rb file
  belongs_to :article
  belongs_to :category

end