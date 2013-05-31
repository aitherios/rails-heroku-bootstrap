class AddHrefToContentBlocks < ActiveRecord::Migration
  def change
    add_column :content_blocks, :href, :string
  end
end
