class CreateContentBlocks < ActiveRecord::Migration
  def change
    create_table :content_blocks do |t|
      t.string     :name, unique: true
      t.text       :body
      t.timestamps
    end

    add_index :content_blocks, :name, unique: true
  end
end
