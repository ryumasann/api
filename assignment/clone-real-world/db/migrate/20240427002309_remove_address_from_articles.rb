class RemoveAddressFromArticles < ActiveRecord::Migration[7.1]
  def change
    remove_column :articles, :address, :text
  end
end
