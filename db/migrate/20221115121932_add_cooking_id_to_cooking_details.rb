class AddCookingIdToCookingDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :cooking_details, :cooking_id, :integer
    add_column :cooking_details, :member_id, :integer
  end
end
