class CreateFoodCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :food_categories do |t|
      t.integer :food_id
      t.integer :category_id
    
    t.index [:category_id, :menu_id], name: "index_categories_menus_on_category_id_and_menu_id"
    t.index [:menu_id, :category_id], name: "index_categories_menus_on_menu_id_and_category_id"
      t.timestamps
    end
  end
end
