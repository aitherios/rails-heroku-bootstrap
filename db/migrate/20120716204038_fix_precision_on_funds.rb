class FixPrecisionOnFunds < ActiveRecord::Migration
  def up
    change_column :funds, :minimum_investiment, :decimal, :precision => 14, :scale => 2, :default => 0.0
    change_column :funds, :management_fee,      :decimal, :precision => 4,  :scale => 2, :default => 0.0
    change_column :funds, :daily_return,        :decimal, :precision => 8,  :scale => 2, :default => 0.0
    change_column :funds, :monthly_return,      :decimal, :precision => 8,  :scale => 2, :default => 0.0
    change_column :funds, :anual_return,        :decimal, :precision => 8,  :scale => 2, :default => 0.0
    change_column :funds, :net_worth,           :decimal, :precision => 17, :scale => 2, :default => 0.0
  end

  def down
    change_column :funds, :minimum_investiment, :decimal, :precision => 12, :scale => 2, :default => 0.0
    change_column :funds, :management_fee,      :decimal, :precision => 2,  :scale => 2, :default => 0.0
    change_column :funds, :daily_return,        :decimal, :precision => 6,  :scale => 2, :default => 0.0
    change_column :funds, :monthly_return,      :decimal, :precision => 6,  :scale => 2, :default => 0.0
    change_column :funds, :anual_return,        :decimal, :precision => 6,  :scale => 2, :default => 0.0
    change_column :funds, :net_worth,           :decimal, :precision => 15, :scale => 2, :default => 0.0
  end
end
