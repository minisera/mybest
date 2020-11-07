class CreatePickGs < ActiveRecord::Migration[6.0]
  def change
    create_table :pick_gs do |t|
      t.references :user,   foreign_key: true
      t.references :post_g, foreign_key: true
      t.timestamps
    end
  end
end
