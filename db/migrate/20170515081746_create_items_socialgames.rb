class CreateItemsSocialgames < ActiveRecord::Migration[5.1]
  def change
    create_table :items_socialgames do |t|
      t.string :title
      t.string :url
      t.string :img
      t.string :site

      t.timestamps
    end
  end
end
