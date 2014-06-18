class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs, id: :uuid do |t|
      t.uuid :duty_id, index: true
      t.uuid :user_id, index: true
      t.date :starts_on
      t.date :ends_on

      t.timestamps
    end
  end
end