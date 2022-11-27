class CreateCookingDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :cooking_details do |t|
      t.text :introduction

      t.timestamps
    end
  end
end
