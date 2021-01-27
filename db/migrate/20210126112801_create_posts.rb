class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :source
      t.string :source_url
      t.references :user, foreign_key: true
      t.string :age_rating
      t.string :category

      t.timestamps
    end
  end
end
