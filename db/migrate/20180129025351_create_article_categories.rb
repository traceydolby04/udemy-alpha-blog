class CreateArticleCategories < ActiveRecord::Migration[5.1]
  def change
    # table created for many to many association between articles and categories tables
    create_table :article_categories do |t|
      t.integer :article_id
      t.integer :category_id
    end
  end
end
