class CreateCalendarReportTypes < ActiveRecord::Migration
  def change
    create_table :calendar_report_types do |t|
    	t.string :name
		t.string :month

    end
  end
end
