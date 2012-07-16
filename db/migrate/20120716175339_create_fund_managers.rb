class CreateFundManagers < ActiveRecord::Migration
  def change
    create_table :fund_managers do |t|
      t.string :name

      t.timestamps
    end
  end
end
