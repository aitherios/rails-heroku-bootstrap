class CreateFundTypes < ActiveRecord::Migration
  def change
    create_table :fund_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
