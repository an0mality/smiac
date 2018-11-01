class AddColumnToCalendarReportType < ActiveRecord::Migration
  def change
  	add_column :calendar_report_types, :color, :string
  end
end
