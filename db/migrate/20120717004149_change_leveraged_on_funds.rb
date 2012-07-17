class ChangeLeveragedOnFunds < ActiveRecord::Migration
  def up
    rename_column :funds, :levereged, :leveraged
    change_column :funds, :leveraged, :string
  end

  def down
    rename_column :funds, :leveraged, :levereged
    change_column :funds, :leveraged, :boolean, default: true
  end
end
