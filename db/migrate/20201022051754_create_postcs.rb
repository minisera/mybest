class CreatePostcs < ActiveRecord::Migration[6.0]
  def change
    create_table :postcs do |t|
      t.string :title
      t.text :story

      t.timestamps
    end
  end
end
