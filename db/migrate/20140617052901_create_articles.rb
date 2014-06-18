class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles, id: :uuid  do |t|
      t.string :title
      t.string :body
      t.uuid :user_id, index: true

      t.timestamps
    end
  end
end