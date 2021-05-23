class AddImageDataToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :image_data, :text
    remove_column :articles, :image
    add_column :articles, :image_data, :text
  end
end
