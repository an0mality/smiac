class AddBossToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :boss, :boolean, default: false
  end
end
