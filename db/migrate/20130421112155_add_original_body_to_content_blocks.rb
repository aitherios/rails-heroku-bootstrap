class AddOriginalBodyToContentBlocks < ActiveRecord::Migration
  def change
    change_table :content_blocks do |t|
      t.text :original_body
    end
  end
end
