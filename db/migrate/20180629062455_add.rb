class Add < ActiveRecord::Migration
  def change
  	add_column :calendar_lists, :report_name, :string
  end
end
