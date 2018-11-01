class AddEmployeeName < ActiveRecord::Migration
  def change
  	add_column :calendar_lists, :employee_str, :string
  end
end
