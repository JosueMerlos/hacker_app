class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.bigint :object_id, null: false
      t.text :title
      t.string :url
      t.string :author
      t.integer :points
      t.text :comment_text
      t.integer :num_comments
      t.bigint :story_id
      t.text :story_title
      t.string :story_url
      t.bigint :parent_id
      t.datetime :publish_date, null: false
      t.string :tag, null: false

      t.timestamps
    end
    add_index :articles, :object_id, unique: true
  end
end
