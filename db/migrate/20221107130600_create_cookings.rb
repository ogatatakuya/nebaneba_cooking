class CreateCookings < ActiveRecord::Migration[6.1]
  def change
    create_table :cookings do |t|
      t.integer :tag_id, null: false
      t.integer :member_id, null: false
      t.integer :bookmark_id
      t.string :name, null: false
      t.text :introduction, null: false

      t.timestamps
    end
  end
end
