class CreateDuties < ActiveRecord::Migration
  def change
    create_table :duties do |t|
      t.string :title

      t.timestamps
    end
  end
end
