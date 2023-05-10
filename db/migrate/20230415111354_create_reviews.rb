class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :customer_id, null: false
      t.integer :submission_id, null: false
      t.float :star
      t.text :comment, null: false
      
      

      t.timestamps
    end
  end
end
