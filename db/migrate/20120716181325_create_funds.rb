class CreateFunds < ActiveRecord::Migration
  def change
    create_table :funds do |t|
      t.string :name
      t.references :fund_manager
      t.boolean :levereged
      t.references :fund_type
      t.decimal :minimum_investiment, precision: 12, scale: 2, default: 0.0
      t.decimal :management_fee, precision: 2, scale: 2, default: 0.0
      t.decimal :daily_return, precision: 6, scale: 2, default: 0.0
      t.decimal :monthly_return, precision: 6, scale: 2, default: 0.0
      t.decimal :anual_return, precision: 6, scale: 2, default: 0.0
      t.decimal :net_worth, precision: 15, scale: 2, default: 0.0
      t.date :start_date

      t.timestamps
    end
    add_index :funds, :fund_manager_id
    add_index :funds, :fund_type_id
  end
end