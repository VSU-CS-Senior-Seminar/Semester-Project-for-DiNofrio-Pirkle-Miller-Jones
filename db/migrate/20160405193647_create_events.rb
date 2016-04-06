class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :content
      t.date :day_of

      t.timestamps null: false
    end
  end
end
