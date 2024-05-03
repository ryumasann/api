class CreateTagArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :tag_articles do |t|
      t.integer :tag_id
      t.integer :article_id

      t.timestamps
    end
  end
end
