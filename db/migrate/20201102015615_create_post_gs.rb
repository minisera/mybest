class CreatePostGs < ActiveRecord::Migration[6.0]
  def change
    create_table :post_gs do |t|
      t.references :user,foreign_key: true
      t.string :title,null: false
      t.string :place,null: false
      t.string :brand,null: false
      t.text :story,null: false
      t.text :evidence,null: false
      t.timestamps
    end
  end
end