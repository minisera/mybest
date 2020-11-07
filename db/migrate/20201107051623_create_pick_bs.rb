class CreatePickBs < ActiveRecord::Migration[6.0]
  def change
    create_table :pick_bs do |t|
      t.references :user,   foreign_key: true
      t.references :post_b, foreign_key: true
      t.timestamps
    end
  end
end
