class RemoveColumnFromUser < ActiveRecord::Migration
  def change
  	remove_column :users, :boolean
  end
end
