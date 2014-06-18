class CreateDuties < ActiveRecord::Migration
  def change
    create_table :duties, id: :uuid do |t|
      t.string :title

      t.timestamps
    end
  end
end