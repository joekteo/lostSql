class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments, id: :uuid  do |t|
      t.string :body
      t.uuid :article_id, index: true
      t.uuid :comment_id, index: true
      t.uuid :user_id, index: true

      t.timestamps
    end
  end
end