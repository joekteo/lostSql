class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :duty, index: true
      t.references :user, index: true
      t.date :starts_on
      t.date :ends_on

      t.timestamps
    end
  end
end
