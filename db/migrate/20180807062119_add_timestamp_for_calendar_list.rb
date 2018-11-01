class AddTimestampForCalendarList < ActiveRecord::Migration
  def change
  	add_column :calendar_lists, :updated_at, :timestamp
  end
end
