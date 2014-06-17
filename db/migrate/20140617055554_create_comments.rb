class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.references :article, index: true
      t.references :user, index: true
      t.references :comment, index: true

      t.timestamps
    end
  end
end
