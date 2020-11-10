class CreateCommentGs < ActiveRecord::Migration[6.0]
  def change
    create_table :comment_gs do |t|
      t.references :user,foreign_key: true
      t.references :post_g, foreign_key: true
      t.text :text,nul: false
      t.timestamps
    end
  end
end
