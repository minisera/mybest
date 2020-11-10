class CreateCommentCs < ActiveRecord::Migration[6.0]
  def change
    create_table :comment_cs do |t|
      t.references :user,foreign_key: true
      t.references :post_c, foreign_key: true
      t.text :text,nul: false
      t.timestamps
    end
  end
end
