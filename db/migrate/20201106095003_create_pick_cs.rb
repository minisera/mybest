class CreatePickCs < ActiveRecord::Migration[6.0]
  def change
    create_table :pick_cs do |t|
      t.references :user,   foreign_key: true
      t.references :post_c, foreign_key: true
      t.timestamps
    end
  end
end
