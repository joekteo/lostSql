class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: :uuid  do |t|
      t.string :name
      t.string :email, index: true

      t.timestamps
    end
  end
end