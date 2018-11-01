class CreateCalendarLists < ActiveRecord::Migration
  def change
    create_table :calendar_lists do |t|
    	t.text :name
    	t.string :report_period
    	t.belongs_to :employee
		t.text :submitting_date
		
		t.belongs_to :calendar_report_type
		
    t.string :hour
    t.string :day
    t.string :wday
    end
  end
end
