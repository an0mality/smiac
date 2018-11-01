class AddColumnToSubscribes < ActiveRecord::Migration
  def change
  	add_column :subscribes, :calendar, :boolean
  end
end
