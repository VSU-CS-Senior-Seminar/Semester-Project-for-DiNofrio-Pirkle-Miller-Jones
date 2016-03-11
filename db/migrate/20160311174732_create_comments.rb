class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :username
      t.text :content
      t.integer :likes

      t.timestamps null: false
    end
  end
end
