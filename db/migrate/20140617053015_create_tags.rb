class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags, id: :uuid  do |t|
      t.string :name, index: true

      t.timestamps
    end

    create_table :articles_tags, id: false do |t|
      t.uuid :article_id, index: true
      t.uuid :tag_id, index: true
    end
  end
end