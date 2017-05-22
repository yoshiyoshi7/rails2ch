class CreateItemsAnimegames < ActiveRecord::Migration[5.1]
  def change
    create_table :items_animegames do |t|
      t.string :title
      t.string :url
      t.string :img
      t.string :site
      t.text :data

      t.timestamps
    end
  end
end
