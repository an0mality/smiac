class CreateCalendarSchedules < ActiveRecord::Migration
  def change
    create_table :calendar_schedules do |t|
    	t.belongs_to :calendar_list
    	t.timestamp :start_date
    	t.timestamp :end_date
    end
  end
end
