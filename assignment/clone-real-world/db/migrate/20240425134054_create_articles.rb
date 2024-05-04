class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.text :body
      t.string :slug, null: false, unique: true
      t.string :title, null: false, unique: true
      t.string :description

      t.timestamps
    end
  end
end
