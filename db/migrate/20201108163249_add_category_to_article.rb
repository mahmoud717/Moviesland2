class AddCategoryToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :category_id, :string
  end
end
