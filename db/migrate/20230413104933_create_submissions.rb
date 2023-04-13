class CreateSubmissions < ActiveRecord::Migration[6.1]
  def change
    create_table :submissions do |t|
      t.integer :customer_id, null: false
      t.integer :genres_id, null: false
      t.string :name, null: false
      t.integer :price, null: false
      t.text :introduction, null: false

      t.timestamps
    end
  end
end
