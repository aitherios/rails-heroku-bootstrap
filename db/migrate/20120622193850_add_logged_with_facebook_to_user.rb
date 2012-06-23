class AddLoggedWithFacebookToUser < ActiveRecord::Migration
  def change
    add_column :users, :logged_with_facebook, :boolean, default: false
  end
end
